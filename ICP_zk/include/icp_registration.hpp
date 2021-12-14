/*
  *@Author: Zhai Kai
  *@Data:2021-10-26 09:37
  */

 #ifndef ICP_REGISTRATION_HPP
 #define ICP_REGISTRATION_HPP

 #include <pcl-1.8/pcl/registration/icp.h>
 #include "registration_interface.hpp"

 class ICPRegistration : public RegistrationInterface{
    public:
    ICPRegistration(const YAML::Node& node);
    ICPRegistration(
        float max_corr_dist,
        float trans_eps,
        float euc_fitness_eps,
        int  max_iter
    );

    bool SetInputTarget(const CloudData::CLOUD_PTR& input_target) override;
    bool ScanMatch(const CloudData::CLOUD_PTR& input_source,
                                       const Eigen::Matrix4f& predict_pose,
                                        CloudData::CLOUD_PTR& result_cloud_ptr,
                                        Eigen::Matrix4f& result_pose) override;

    private:
    bool SetRegistrationParam(
      float max_corr_dist, 
      float trans_eps, 
      float euc_fitness_eps, 
      int max_iter
    );

    private:
    pcl::IterativeClosestPoint<CloudData::POINT, CloudData::POINT>::Ptr icp_ptr_;

 };

 #endif