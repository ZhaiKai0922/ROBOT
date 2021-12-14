/* \author Radu Bogdan Rusu
 * adaptation Raphael Favier*/
#include <boost/make_shared.hpp>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/point_representation.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/filter.h>
#include <pcl/features/normal_3d.h>
#include <pcl/registration/icp.h>
#include <pcl/registration/icp_nl.h>
#include <pcl/registration/transforms.h>
#include <pcl/visualization/pcl_visualizer.h>
using pcl::visualization::PointCloudColorHandlerGenericField;
using pcl::visualization::PointCloudColorHandlerCustom;

typedef pcl::PointXYZ PointT;
typedef pcl::PointCloud<PointT> PointCloud;
typedef pcl::PointNormal PointNormalT;
typedef pcl::PointCloud<PointNormalT> PointCloudWithNormals;

	pcl::visualization::PCLVisualizer *p;

	int vp_1, vp_2;

struct PCD
{
  PointCloud::Ptr cloud;
  std::string f_name;
  PCD() : cloud (new PointCloud) {};
};
struct PCDComparator
{
  bool operator () (const PCD& p1, const PCD& p2)
  {
    return (p1.f_name < p2.f_name);
  }
};

class MyPointRepresentation : public pcl::PointRepresentation <PointNormalT>
{
  using pcl::PointRepresentation<PointNormalT>::nr_dimensions_;
public:
  MyPointRepresentation ()
  {

    nr_dimensions_ = 4;
  }

  virtual void copyToFloatArray (const PointNormalT &p, float * out) const
  {
    // < x, y, z, curvature >
    out[0] = p.x;
    out[1] = p.y;
    out[2] = p.z;
    out[3] = p.curvature;
  }
};
////////////////////////////////////////////////////////////////////////////////

void showCloudsLeft(const PointCloud::Ptr cloud_target, const PointCloud::Ptr cloud_source)
{
  p->removePointCloud ("vp1_target");
  p->removePointCloud ("vp1_source");
  PointCloudColorHandlerCustom<PointT> tgt_h (cloud_target, 0, 255, 0);
  PointCloudColorHandlerCustom<PointT> src_h (cloud_source, 255, 0, 0);
  p->addPointCloud (cloud_target, tgt_h, "vp1_target", vp_1);
  p->addPointCloud (cloud_source, src_h, "vp1_source", vp_1);
  PCL_INFO ("Press q to begin the registration.\n");
  p-> spin();
}
////////////////////////////////////////////////////////////////////////////////

void showCloudsRight(const PointCloudWithNormals::Ptr cloud_target, const PointCloudWithNormals::Ptr cloud_source)
{
  p->removePointCloud ("source");
  p->removePointCloud ("target");
  PointCloudColorHandlerGenericField<PointNormalT> tgt_color_handler (cloud_target, "curvature");
  if (!tgt_color_handler.isCapable ())
      PCL_WARN ("Cannot create curvature color handler!");
  PointCloudColorHandlerGenericField<PointNormalT> src_color_handler (cloud_source, "curvature");
  if (!src_color_handler.isCapable ())
      PCL_WARN ("Cannot create curvature color handler!");
  p->addPointCloud (cloud_target, tgt_color_handler, "target", vp_2);
  p->addPointCloud (cloud_source, src_color_handler, "source", vp_2);
  p->spinOnce();
}


////////////////////////////////////////////////////////////////////////////////
void loadData (int argc, char **argv, std::vector<PCD, Eigen::aligned_allocator<PCD> > &models)
{
  std::string extension (".pcd");

  for (int i = 1; i < argc; i++)
  {
    std::string fname = std::string (argv[i]);

    if (fname.size () <= extension.size ())
      continue;
    std::transform (fname.begin (), fname.end (), fname.begin (), (int(*)(int))tolower);

    if (fname.compare (fname.size () - extension.size (), extension.size (), extension) == 0)
    {

      PCD m;
      m.f_name = argv[i];
      pcl::io::loadPCDFile (argv[i], *m.cloud);

      std::vector<int> indices;
      pcl::removeNaNFromPointCloud(*m.cloud,*m.cloud, indices);
      models.push_back (m);
    }
  }
}



////////////////////////////////////////////////////////////////////////////////

void pairAlign (const PointCloud::Ptr cloud_src, const PointCloud::Ptr cloud_tgt, PointCloud::Ptr output, Eigen::Matrix4f &final_transform, bool downsample = false)
{
  //

  PointCloud::Ptr src (new PointCloud);
  PointCloud::Ptr tgt (new PointCloud);
  pcl::VoxelGrid<PointT> grid;
  if (downsample)
  {
    grid.setLeafSize (0.05, 0.05, 0.05);
    grid.setInputCloud (cloud_src);
    grid.filter (*src);
    grid.setInputCloud (cloud_tgt);
    grid.filter (*tgt);
  }
  else
  {
    src = cloud_src;
    tgt = cloud_tgt;
  }

  PointCloudWithNormals::Ptr points_with_normals_src (new PointCloudWithNormals);
  PointCloudWithNormals::Ptr points_with_normals_tgt (new PointCloudWithNormals);
  pcl::NormalEstimation<PointT, PointNormalT> norm_est;
  pcl::search::KdTree<pcl::PointXYZ>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZ> ());
  norm_est.setSearchMethod (tree);
  norm_est.setKSearch (30);
  norm_est.setInputCloud (src);
  norm_est.compute (*points_with_normals_src);
  pcl::copyPointCloud (*src, *points_with_normals_src);
  norm_est.setInputCloud (tgt);
  norm_est.compute (*points_with_normals_tgt);
  pcl::copyPointCloud (*tgt, *points_with_normals_tgt);
  //

  MyPointRepresentation point_representation;

  float alpha[4] = {1.0, 1.0, 1.0, 1.0};
  point_representation.setRescaleValues (alpha);
  //

  pcl::IterativeClosestPointNonLinear<PointNormalT, PointNormalT> reg;
  reg.setTransformationEpsilon (1e-6);


  reg.setMaxCorrespondenceDistance (0.1);  

  reg.setPointRepresentation (boost::make_shared<const MyPointRepresentation> (point_representation));
  //reg.setInputCloud (points_with_normals_src);
  reg.setInputSource (points_with_normals_src);
  reg.setInputTarget (points_with_normals_tgt);
  //

  Eigen::Matrix4f Ti = Eigen::Matrix4f::Identity (), prev, targetToSource;
  PointCloudWithNormals::Ptr reg_result = points_with_normals_src;
  reg.setMaximumIterations (2);
  for (int i = 0; i < 30; ++i)
  {
    PCL_INFO ("Iteration Nr. %d.\n", i);

    points_with_normals_src = reg_result;

    //reg.setInputCloud (points_with_normals_src);
    reg.setInputSource (points_with_normals_src);
    reg.align (*reg_result);

    Ti = reg.getFinalTransformation () * Ti;


    if (fabs ((reg.getLastIncrementalTransformation () - prev).sum ()) < reg.getTransformationEpsilon ())
      reg.setMaxCorrespondenceDistance (reg.getMaxCorrespondenceDistance () - 0.001);
      prev = reg.getLastIncrementalTransformation ();

    showCloudsRight(points_with_normals_tgt, points_with_normals_src);
  }


  targetToSource = Ti.inverse();

  pcl::transformPointCloud (*cloud_tgt, *output, targetToSource);
  p->removePointCloud ("source");
  p->removePointCloud ("target");
  PointCloudColorHandlerCustom<PointT> cloud_tgt_h (output, 0, 255, 0);
  PointCloudColorHandlerCustom<PointT> cloud_src_h (cloud_src, 255, 0, 0);
  p->addPointCloud (output, cloud_tgt_h, "target", vp_2);
  p->addPointCloud (cloud_src, cloud_src_h, "source", vp_2);
	PCL_INFO ("Press q to continue the registration.\n");
  p->spin ();
  p->removePointCloud ("source"); 
  p->removePointCloud ("target");

  *output += *cloud_src;
    final_transform = targetToSource;
 }

 //***************************main************************************
int main (int argc, char** argv)
{
  std::vector<PCD, Eigen::aligned_allocator<PCD> > data;
  loadData (argc, argv, data);

  if (data.empty ())
  {
    PCL_ERROR ("Syntax is: %s <source.pcd> <target.pcd> [*]", argv[0]);
    PCL_ERROR ("[*] - multiple files can be added. The registration results of (i, i+1) will be registered against (i+2), etc");
    PCL_INFO ("Example: %s `rospack find pcl`/test/bun0.pcd `rospack find pcl`/test/bun4.pcd", argv[0]);
    return (-1);
  }
  PCL_INFO ("Loaded %d datasets.", (int)data.size ());

  p = new pcl::visualization::PCLVisualizer (argc, argv, "Pairwise Incremental Registration example");
  p->createViewPort (0.0, 0, 0.5, 1.0, vp_1);
  p->createViewPort (0.5, 0, 1.0, 1.0, vp_2);
	PointCloud::Ptr result (new PointCloud), source, target;
  Eigen::Matrix4f GlobalTransform = Eigen::Matrix4f::Identity (), pairTransform;
  for (size_t i = 1; i < data.size (); ++i)
  {
    source = data[i-1].cloud;
    target = data[i].cloud;

    showCloudsLeft(source, target);
    PointCloud::Ptr temp (new PointCloud);
    PCL_INFO ("Aligning %s (%d) with %s (%d).\n", data[i-1].f_name.c_str (), source->points.size (), data[i].f_name.c_str (), target->points.size ());
    pairAlign (source, target, temp, pairTransform, true);

    pcl::transformPointCloud (*temp, *result, GlobalTransform);

    GlobalTransform = pairTransform * GlobalTransform;

    std::stringstream ss;
    ss << i << ".pcd";
    pcl::io::savePCDFile (ss.str (), *result, true);
  }
}

