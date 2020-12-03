# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_msg: 19 messages, 10 services")

set(MSG_I_FLAGS "-Irobot_msg:/home/firefly/catkin_ws/src/ros_release/robot_msg/msg;-Irobot_msg:/home/firefly/catkin_ws/devel/share/robot_msg/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/melodic/share/nav_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_msg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv" "geometry_msgs/Pose:geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/PoseStamped:std_msgs/Header"
)

get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg" "actionlib_msgs/GoalID:robot_msg/auto_dockGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg" "geometry_msgs/Point32:geometry_msgs/Polygon"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg" "geometry_msgs/Polygon:geometry_msgs/Point32:robot_msg/Restrict"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv" "geometry_msgs/Point32:robot_msg/Restrict:geometry_msgs/Polygon:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg" "geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion:std_msgs/Header"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg" "geometry_msgs/Pose:nav_msgs/MapMetaData:geometry_msgs/Point:geometry_msgs/Quaternion:std_msgs/Header"
)

get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv" "geometry_msgs/Polygon:geometry_msgs/Point32:robot_msg/Restrict"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv" "geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion:std_msgs/Header"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg" "geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:robot_msg/auto_dockResult:std_msgs/Header"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg" ""
)

get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg" "actionlib_msgs/GoalID:robot_msg/auto_dockActionResult:robot_msg/auto_dockResult:actionlib_msgs/GoalStatus:robot_msg/auto_dockActionGoal:robot_msg/auto_dockActionFeedback:robot_msg/auto_dockFeedback:std_msgs/Header:robot_msg/auto_dockGoal"
)

get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:robot_msg/auto_dockFeedback:std_msgs/Header"
)

get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg" NAME_WE)
add_custom_target(_robot_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_msg" "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg" "geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_msg_cpp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)

### Generating Services
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)
_generate_srv_cpp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
)

### Generating Module File
_generate_module_cpp(robot_msg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_msg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_msg_generate_messages robot_msg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_cpp _robot_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msg_gencpp)
add_dependencies(robot_msg_gencpp robot_msg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_msg_eus(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)

### Generating Services
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)
_generate_srv_eus(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
)

### Generating Module File
_generate_module_eus(robot_msg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robot_msg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robot_msg_generate_messages robot_msg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_eus _robot_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msg_geneus)
add_dependencies(robot_msg_geneus robot_msg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_msg_lisp(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)

### Generating Services
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)
_generate_srv_lisp(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
)

### Generating Module File
_generate_module_lisp(robot_msg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_msg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_msg_generate_messages robot_msg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_lisp _robot_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msg_genlisp)
add_dependencies(robot_msg_genlisp robot_msg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_msg_nodejs(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)

### Generating Services
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)
_generate_srv_nodejs(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
)

### Generating Module File
_generate_module_nodejs(robot_msg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robot_msg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robot_msg_generate_messages robot_msg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_nodejs _robot_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msg_gennodejs)
add_dependencies(robot_msg_gennodejs robot_msg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/nav_msgs/cmake/../msg/MapMetaData.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_msg_py(robot_msg
  "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)

### Generating Services
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Polygon.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point32.msg;/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)
_generate_srv_py(robot_msg
  "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
)

### Generating Module File
_generate_module_py(robot_msg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_msg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_msg_generate_messages robot_msg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LeanMap.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/DockingState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/CartoToVisionMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionGoal.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ActionState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/BaseInfo.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Restrict.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/RestrictArray.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetMap.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/SlamStatus.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/Humidifier.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/StringOccupancyGrid.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetRestrict.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapLoading.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/MapSaving.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetSlam.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetAction.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/LocalizationState.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionResult.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/TrainScan.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SetDevice.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/srv/SaveFrames.srv" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/FeedBack.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockAction.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/devel/share/robot_msg/msg/auto_dockActionFeedback.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/firefly/catkin_ws/src/ros_release/robot_msg/msg/ScoredPose.msg" NAME_WE)
add_dependencies(robot_msg_generate_messages_py _robot_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_msg_genpy)
add_dependencies(robot_msg_genpy robot_msg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_msg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_msg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(robot_msg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(robot_msg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(robot_msg_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(robot_msg_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(robot_msg_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_msg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(robot_msg_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(robot_msg_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(robot_msg_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(robot_msg_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(robot_msg_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_msg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(robot_msg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(robot_msg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(robot_msg_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(robot_msg_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(robot_msg_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_msg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(robot_msg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(robot_msg_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(robot_msg_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(robot_msg_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(robot_msg_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_msg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(robot_msg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(robot_msg_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(robot_msg_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(robot_msg_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(robot_msg_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
