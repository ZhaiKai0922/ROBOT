execute_process(COMMAND "/home/firefly/catkin_ws/build/ros_release/navigation_extended/base_local_planner/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/firefly/catkin_ws/build/ros_release/navigation_extended/base_local_planner/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
