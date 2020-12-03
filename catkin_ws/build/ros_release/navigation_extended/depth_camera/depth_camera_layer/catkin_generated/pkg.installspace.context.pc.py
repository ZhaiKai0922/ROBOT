# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include".split(';') if "${prefix}/include;/usr/include" != "" else []
PROJECT_CATKIN_DEPENDS = "angles;costmap_2d;dynamic_reconfigure;geometry_msgs;pluginlib;roscpp;sensor_msgs;tf2_geometry_msgs;message_filters;tf2;tf2_ros;robot_msg".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lcostmap_2d;-llayers;-ldepth_camera_layer;/usr/lib/aarch64-linux-gnu/libboost_system.so;/usr/lib/aarch64-linux-gnu/libboost_thread.so;/usr/lib/aarch64-linux-gnu/libboost_chrono.so;/usr/lib/aarch64-linux-gnu/libboost_date_time.so;/usr/lib/aarch64-linux-gnu/libboost_atomic.so;/usr/lib/aarch64-linux-gnu/libpthread.so".split(';') if "-lcostmap_2d;-llayers;-ldepth_camera_layer;/usr/lib/aarch64-linux-gnu/libboost_system.so;/usr/lib/aarch64-linux-gnu/libboost_thread.so;/usr/lib/aarch64-linux-gnu/libboost_chrono.so;/usr/lib/aarch64-linux-gnu/libboost_date_time.so;/usr/lib/aarch64-linux-gnu/libboost_atomic.so;/usr/lib/aarch64-linux-gnu/libpthread.so" != "" else []
PROJECT_NAME = "depth_camera_layer"
PROJECT_SPACE_DIR = "/home/firefly/catkin_ws/install"
PROJECT_VERSION = "0.5.0"
