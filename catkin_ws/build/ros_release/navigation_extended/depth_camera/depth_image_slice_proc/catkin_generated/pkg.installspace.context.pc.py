# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "eigen_conversions;image_geometry;image_transport;message_filters;nodelet;sensor_msgs;geometry_msgs;stereo_msgs;tf2;tf;tf2_ros;pcl_ros;roscpp;pluginlib".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-ldepth_image_slice_proc".split(';') if "-ldepth_image_slice_proc" != "" else []
PROJECT_NAME = "depth_image_slice_proc"
PROJECT_SPACE_DIR = "/home/firefly/catkin_ws/install"
PROJECT_VERSION = "1.15.0"
