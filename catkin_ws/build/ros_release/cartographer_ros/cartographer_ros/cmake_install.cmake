# Install script for directory: /home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros

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
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/firefly/catkin_ws/build/ros_release/cartographer_ros/cartographer_ros/catkin_generated/installspace/cartographer_ros.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cartographer_ros/cmake" TYPE FILE FILES
    "/home/firefly/catkin_ws/build/ros_release/cartographer_ros/cartographer_ros/catkin_generated/installspace/cartographer_rosConfig.cmake"
    "/home/firefly/catkin_ws/build/ros_release/cartographer_ros/cartographer_ros/catkin_generated/installspace/cartographer_rosConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cartographer_ros" TYPE DIRECTORY FILES
    "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/launch"
    "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/urdf"
    "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/configuration_files"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cartographer_ros" TYPE PROGRAM FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/scripts/tf_remove_frames.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/firefly/catkin_ws/devel/lib/libcartographer_ros.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/assets_writer.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/carto_slam.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/map_builder_bridge.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros/metrics" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/metrics/family_factory.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros/metrics/internal" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/metrics/internal/counter.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros/metrics/internal" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/metrics/internal/family.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros/metrics/internal" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/metrics/internal/gauge.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros/metrics/internal" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/metrics/internal/histogram.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/msg_conversion.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/node.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/node_constants.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/node_options.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/offline_node.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/playable_bag.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/ros_log_sink.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/ros_map.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/ros_map_writing_points_processor.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/rotation_angle.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/sensor_bridge.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/submap.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/tf_bridge.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/time_conversion.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/trajectory_options.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cartographer_ros" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/urdf_reader.h")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/firefly/catkin_ws/build/ros_release/cartographer_ros/cartographer_ros/cartographer_ros/cmake_install.cmake")

endif()

