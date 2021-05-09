# filtering_zk

## 基于IMU数据的解算＋基于IMU数据的Kalman预测＋基于地图匹配定位的Kalman观测　最终输出fusion odom

### `roslaunch lidar_localization kitti_localization.launch`

## 初始位姿采用Scan Context 进行检测

### `rosservice call  /save_odometry "{}"`  //保存轨迹

`evo_ape kitti ground_truth.txt laser.txt -r full --plot --plot_mode xy`

`evo_ape kitti ground_truth.txt fused.txt -r full --plot --plot_mode xy`



## JUST DO IT

2021.5.8