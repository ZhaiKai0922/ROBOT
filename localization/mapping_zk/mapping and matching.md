# mapping and matching

## 1.建图环节：

### 实现基于Lidar里程计的NDT帧间匹配定位，然后添加回环进行优化建图．

### 优化环节采用g2o的优化库．

`roslaunch lidar_localization mapping.launch`

## 2.匹配环节：

### 采用Scan Context进行位姿初始化

### 采用与地图匹配算法进行定位

`roslaunch lidar_localization matching.launch`

### 3.几个service

`rosservice call  /optimize_map`

`rosservice call /save_map`

`rosservice call /save_scan_context`      //进行位姿初始化所需要的scan context



## JUST DO IT

2021/5/7  9:13

