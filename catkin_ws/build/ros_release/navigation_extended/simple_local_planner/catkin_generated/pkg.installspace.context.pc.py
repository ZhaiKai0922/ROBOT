# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;dynamic_reconfigure;tf;pluginlib;costmap_2d;nav_core;angles".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lsimple_local_planner;-lpure_planner_ros".split(';') if "-lsimple_local_planner;-lpure_planner_ros" != "" else []
PROJECT_NAME = "simple_local_planner"
PROJECT_SPACE_DIR = "/home/firefly/catkin_ws/install"
PROJECT_VERSION = "1.0.0"
