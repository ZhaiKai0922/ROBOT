# CMakeLists文件规划学习

**在学习他人代码的过程中了解到一些CMakeLists的使用技巧，所以进行一个简单总结**

## 1. 把各个包放在单独的cmake文件中

调用一个包，就是常规的三个步骤：find_package，include_directions，target_link_libraries

包多的时候代码太杂，所以我们需要把每个包对应的这些操作放在cmake文件夹下对应的XX.cmake文件中，然后在CMakeList中include(cmake/XX.cmake)一行代码就可以搞定。

## 2. 合并变量

为了避免target_link_libraries后面跟着很长一串库的名字，而且库增减的时候也要跟着增减，我们在CMakeList文件开始就定义一个变量

```cmake
set(ALL_TARGET_LIBRARIES "")
```

然后在每个库对应的XX.cmake文件中，把库的名字合并到这个变量中去

```cmake
list(APPEND ALL_TARGET_LIBRARIES ${XX_LIBRARIES})
```

这样在target_link_libraries中只需要使用ALL_TARGET_LIBRARIES这一个变量就可以了

除了库对应的变量，还有文件对应的变量，我们在add_executable的时候要把所需要的cpp文件路径都写进去，文件多的时候较麻烦，所有可以使用下面的指令，把所有cpp文件合并到一个变量中

```cmake
file(GLOB_RECURSE ALL_SRCS "*.cpp")
```

但是，当工程中有多个node文件的时候，就要把他们从这个变量中踢出去，因为多个node文件编到一个可执行文件会出错，用下面的代码踢：

```cmake
file(GLOB_RECURSE NODE_SRCS "src/*_node.cpp")
list(REMOVE_ITEM ALL_SRCS ${NODE_SRCS})
```

## 3. 示例

### CMakeList.txt

```cmake
cmake_minimum_required(VERSION 2.8.3)
project(lidar_localization)

SET(CMAKE_BUILD_TYPE "Release")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")
add_compile_options(-std=c++11)
add_definitions(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  pcl_ros
  geometry_msgs
  tf
  eigen_conversions
  message_generation 
  std_srvs
)

add_service_files(
   FILES
   optimizeMap.srv
)

generate_messages(
   DEPENDENCIES
   std_msgs
)
#设置一个变量 ALL_TARGET_LIBRARIES 然后在各个.cmake文件中，把库的名字合并到这个变find_package量中去
set(ALL_TARGET_LIBRARIES "")   
#使用include来包含PCL.cmake中的一些操作，相关内容在后面展示
include(cmake/PCL.cmake)

include_directories(include ${catkin_INCLUDE_DIRS})

catkin_package()

#把当前的.cpp文件都合并到变量ALL_SRCS中去 ，后面add_executable时就不需要把所有cpp文件路径都写入了
file(GLOB_RECURSE ALL_SRCS "*.cpp")
#把所有_node.cpp文件都合并到变量NODE_SRCS中，用于后面踢除
file(GLOB_RECURSE NODE_SRCS "src/apps/*_node.cpp")
#在所有的.cpp文件中踢除_node.cpp文件
list(REMOVE_ITEM ALL_SRCS ${NODE_SRCS})

#现在可以直接使用我们前面定义的变量ALL_SRCS
add_executable(test_frame_node src/apps/test_frame_node.cpp ${ALL_SRCS})
#使用我们前面定义的变量ALL_TARGET_LIBRARIES
target_link_libraries(test_frame_node ${catkin_LIBRARIES} ${ALL_TARGET_LIBRARIES})

add_executable(data_pretreat_node src/apps/data_pretreat_node.cpp ${ALL_SRCS})
add_dependencies(data_pretreat_node ${catkin_EXPORTED_TARGETS})
target_link_libraries(data_pretreat_node ${catkin_LIBRARIES} ${ALL_TARGET_LIBRARIES})

```

### cmake/PCL.cmake

```cmake 
find_package(PCL 1.7 REQUIRED)
list(REMOVE_ITEM PCL_LIBRARIES "vtkproj4")

include_directories(${PCL_INCLUDE_DIRS})
#每个库所对应的.cmake文件中，把每个库的名字合并到ALL_TARGET_LIBRARIES这个变量上去
list(APPEND ALL_TARGET_LIBRARIES ${PCL_LIBRARIES})
```



## 参考链接：

https://zhuanlan.zhihu.com/p/105512661

**文档中若有错误请指出，万分感谢！**