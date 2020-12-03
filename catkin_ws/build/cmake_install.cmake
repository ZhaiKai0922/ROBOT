# Install script for directory: /home/firefly/catkin_ws/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/firefly/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/firefly/catkin_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/firefly/catkin_ws/install" TYPE PROGRAM FILES "/home/firefly/catkin_ws/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/firefly/catkin_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/firefly/catkin_ws/install" TYPE PROGRAM FILES "/home/firefly/catkin_ws/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/firefly/catkin_ws/install/setup.bash;/home/firefly/catkin_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/firefly/catkin_ws/install" TYPE FILE FILES
    "/home/firefly/catkin_ws/build/catkin_generated/installspace/setup.bash"
    "/home/firefly/catkin_ws/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/firefly/catkin_ws/install/setup.sh;/home/firefly/catkin_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/firefly/catkin_ws/install" TYPE FILE FILES
    "/home/firefly/catkin_ws/build/catkin_generated/installspace/setup.sh"
    "/home/firefly/catkin_ws/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/firefly/catkin_ws/install/setup.zsh;/home/firefly/catkin_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/firefly/catkin_ws/install" TYPE FILE FILES
    "/home/firefly/catkin_ws/build/catkin_generated/installspace/setup.zsh"
    "/home/firefly/catkin_ws/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/firefly/catkin_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/firefly/catkin_ws/install" TYPE FILE FILES "/home/firefly/catkin_ws/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/firefly/catkin_ws/build/gtest/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/navigation/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/cartographer_ros/cartographer_ros_msgs/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/launch_nav2/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/laser_driver/ls01b_v2/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/map_server/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/robot_msg/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/user_logic/logic_functin/motion_logic/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/laser_driver/sdkeli_ls_udp/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/base_driver/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/auto_docking/docker_detector/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/depth_camera/ros_astra_camera/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/depth_camera/depth_image_slice_proc/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/depth_camera/depth_point_slice_proc/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/amcl/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/auto_docking/auto_docking_server/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/fake_localization/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/robot_localization/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/cartographer_ros/cartographer_ros/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/cartographer_ros/cartographer_rviz/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/user_logic/logic_functin/user_logic/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/voxel_grid/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/costmap_2d/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/depth_camera/depth_camera_layer/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/nav_core/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/base_local_planner/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/clear_costmap_recovery/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/detect_recovery/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/move_slow_and_clear/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/navfn/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/global_planner/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/range_sensor_layer/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/rotate_recovery/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/move_base/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/navigation_extended/simple_local_planner/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/laser_driver/wj_716_lidar/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/laser_driver/ydlidar_ros/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/base_bringup/cmake_install.cmake")
  include("/home/firefly/catkin_ws/build/ros_release/yocs_velocity_smoother/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/firefly/catkin_ws/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
