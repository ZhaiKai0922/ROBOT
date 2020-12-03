# Install script for directory: /home/firefly/catkin_ws/src/ros_release/robot_msg

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msg/msg" TYPE FILE FILES
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msg/srv" TYPE FILE FILES
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv"
    "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msg/action" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/robot_msg/action/auto_dock.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msg/msg" TYPE FILE FILES
    "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg"
    "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg"
    "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg"
    "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg"
    "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
    "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg"
    "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msg/cmake" TYPE FILE FILES "/home/firefly/catkin_ws/build/ros_release/robot_msg/catkin_generated/installspace/robot_msg-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/firefly/catkin_ws/devel/include/robot_msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/firefly/catkin_ws/devel/share/roseus/ros/robot_msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/firefly/catkin_ws/devel/share/common-lisp/ros/robot_msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/firefly/catkin_ws/devel/share/gennodejs/ros/robot_msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/firefly/catkin_ws/devel/lib/python2.7/dist-packages/robot_msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/firefly/catkin_ws/devel/lib/python2.7/dist-packages/robot_msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/firefly/catkin_ws/build/ros_release/robot_msg/catkin_generated/installspace/robot_msg.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msg/cmake" TYPE FILE FILES "/home/firefly/catkin_ws/build/ros_release/robot_msg/catkin_generated/installspace/robot_msg-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msg/cmake" TYPE FILE FILES
    "/home/firefly/catkin_ws/build/ros_release/robot_msg/catkin_generated/installspace/robot_msgConfig.cmake"
    "/home/firefly/catkin_ws/build/ros_release/robot_msg/catkin_generated/installspace/robot_msgConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_msg" TYPE FILE FILES "/home/firefly/catkin_ws/src/ros_release/robot_msg/package.xml")
endif()

