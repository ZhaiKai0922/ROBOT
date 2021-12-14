cmake_minimum_required(VERSION 2.8)
project(PCL_test)

set(CMAKE_BUILD_TYPE "Release")
add_definitions("-DENABLE_SSE")
set(CMAKE_CXX_FLAGS "-std=c++11 -O2 ${SSE_FLAGS} -msse4")
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

##find_package(OpenCV 3 REQUIRED)
##find_package(G2O REQUIRED)
##find_package(Sophus REQUIRED)
find_package(PCL 1.7 REQUIRED)
find_package(Glog REQUIRED)

set(ALL_TARGET_LIBRARIES "")

include(cmake/glog.cmake)

include_directories(
        ##${OpenCV_INCLUDE_DIRS}
        ##${G2O_INCLUDE_DIRS}
        ##${Sophus_INCLUDE_DIRS}
	${PCL_INCLUDE_DIRS}
        "/usr/include/eigen3/"
	${GLOG_INCLUDE_DIRS}
)

##add_executable(orb_cv orb_cv.cpp)
##target_link_libraries(orb_cv ${OpenCV_LIBS})

##add_executable(orb_self orb_self.cpp)
##target_link_libraries(orb_self ${OpenCV_LIBS})

# add_executable( pose_estimation_2d2d pose_estimation_2d2d.cpp extra.cpp ) # use this if in OpenCV2 
##add_executable(pose_estimation_2d2d pose_estimation_2d2d.cpp)
##target_link_libraries(pose_estimation_2d2d ${OpenCV_LIBS})

# # add_executable( triangulation triangulation.cpp extra.cpp) # use this if in opencv2
##add_executable(triangulation triangulation.cpp)
##target_link_libraries(triangulation ${OpenCV_LIBS})

##add_executable(pose_estimation_3d2d pose_estimation_3d2d.cpp)
##target_link_libraries(pose_estimation_3d2d
##        g2o_core g2o_stuff
##        ${OpenCV_LIBS})

##add_executable(pose_estimation_3d3d pose_estimation_3d3d.cpp)
##target_link_libraries(pose_estimation_3d3d
##        g2o_core g2o_stuff
##        ${OpenCV_LIBS})

add_executable(PCL_test src/example.cpp)
target_link_libraries(PCL_test ${PCL_LIBRARIES})

add_executable(PCL_test_two src/example_two.cpp)
target_link_libraries(PCL_test_two ${PCL_LIBRARIES} ${ALL_TARGET_LIBRARIES})
