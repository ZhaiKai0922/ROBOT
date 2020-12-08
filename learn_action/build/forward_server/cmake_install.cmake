# Install script for directory: /home/zhx/zk/ROBOT/learn_action/src/forward_server

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/zhx/zk/ROBOT/learn_action/install")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/forward_server/action" TYPE FILE FILES "/home/zhx/zk/ROBOT/learn_action/src/forward_server/action/forward.action")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/forward_server/msg" TYPE FILE FILES
    "/home/zhx/zk/ROBOT/learn_action/devel/share/forward_server/msg/forwardAction.msg"
    "/home/zhx/zk/ROBOT/learn_action/devel/share/forward_server/msg/forwardActionGoal.msg"
    "/home/zhx/zk/ROBOT/learn_action/devel/share/forward_server/msg/forwardActionResult.msg"
    "/home/zhx/zk/ROBOT/learn_action/devel/share/forward_server/msg/forwardActionFeedback.msg"
    "/home/zhx/zk/ROBOT/learn_action/devel/share/forward_server/msg/forwardGoal.msg"
    "/home/zhx/zk/ROBOT/learn_action/devel/share/forward_server/msg/forwardResult.msg"
    "/home/zhx/zk/ROBOT/learn_action/devel/share/forward_server/msg/forwardFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/forward_server/cmake" TYPE FILE FILES "/home/zhx/zk/ROBOT/learn_action/build/forward_server/catkin_generated/installspace/forward_server-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/zhx/zk/ROBOT/learn_action/devel/include/forward_server")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/zhx/zk/ROBOT/learn_action/devel/share/roseus/ros/forward_server")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/zhx/zk/ROBOT/learn_action/devel/share/common-lisp/ros/forward_server")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/zhx/zk/ROBOT/learn_action/devel/share/gennodejs/ros/forward_server")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/zhx/zk/ROBOT/learn_action/devel/lib/python2.7/dist-packages/forward_server")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/zhx/zk/ROBOT/learn_action/devel/lib/python2.7/dist-packages/forward_server")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/zhx/zk/ROBOT/learn_action/build/forward_server/catkin_generated/installspace/forward_server.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/forward_server/cmake" TYPE FILE FILES "/home/zhx/zk/ROBOT/learn_action/build/forward_server/catkin_generated/installspace/forward_server-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/forward_server/cmake" TYPE FILE FILES
    "/home/zhx/zk/ROBOT/learn_action/build/forward_server/catkin_generated/installspace/forward_serverConfig.cmake"
    "/home/zhx/zk/ROBOT/learn_action/build/forward_server/catkin_generated/installspace/forward_serverConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/forward_server" TYPE FILE FILES "/home/zhx/zk/ROBOT/learn_action/src/forward_server/package.xml")
endif()

