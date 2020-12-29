# cartographer

https://scholar.chongbuluo.com/　　(百度学术)

https://blog.csdn.net/LilyNothing/article/details/60875825　　(论文翻译)

https://mp.weixin.qq.com/s/LdbFp-Zvkr02-_25ILb16g    （泡泡机器人 理论及实现浅析）

https://blog.csdn.net/weixin_36976685/article/details/89204034　　(源码解析1.1－算法整体结构)

https://zhuanlan.zhihu.com/p/27631583　　(SLAM源码分析)

---

## 1. 相关工作

这里涉及到几种匹配算法：

scan to scan matching:会累计误差，最终误差会很大

scan to map matching:减少了误差的累计（本篇论文使用的方法）

pixel accurate scan matching:最后有说这个算法在后台应用于将scan点集和最近的submap进行匹配，生成loop closing的约束条件。

解决局部误差的累计，有两种方式：一种是粒子滤波法，一个基于图的SLAM方法(graph-based)。这篇文章使用的是后者，讲一下关于graph-based：

graph-based是一种工作于基于位姿和特征的集合的方法。图中的边表示从观察结果中生成的约束，节点表示的是位姿和特征。

## 2. 系统概述

google的cartographer提供了一种室内实时绘图的解决方法，这种方法是基于激光雷达的。绘制2D图像，分辨率是5cm。激光数据scans会以最佳的位置插入到submap中，这个最佳的位置假设在一段时间内是很准确的。scan matching必须是和它相对应的scubmap进行匹配，所以只和最近的scan点集有关。对于位姿的估计误差会在全局的帧当中积累起来。

综合硬件的条件，这篇论文使用的是pose optimization来处理误差累计，当一个子地图建成之后，不再有其他的scan插入这个子图中，这个已有的子图会用来作为loop closing的scan matching。所有子图和scan点集都会用来进行loop closure。如果他们离的足够近的话，那么就尝试在子地图中找到相应的scan。

当一个新的laser scan加入到地图中时，如果该laser scan的估计位姿与地图中的某个submap的某个laser scan的位姿比较接近的话，那么通过某种scan match策略就会找到该闭环

如果在当前估计位置的窗口范围内找到一个足够好的匹配结果，那么这个匹配结果就会被用来作为优化问题的闭环检测约束条件。每隔几秒就进行闭环检测，按照经验来说，就是一个位置点被重复访问之后就算达到闭环了，这样的判断要求闭环检测必须在新的点被加入到submap中之前完成。如果不是，可能导致失败，为了达到这样的目的，通过使用分支上界法以及对于每个完成的submap有对应的几个预处理的网格。

## 3. 局部二维的实时定位和绘图

这个系统实现2DSLAM结合了局部和全局的方法，局部和全局的方法都对LIDAR观测到的位置进行了优化。位置的表示包括(x, y)坐标的转化，以及角度的旋转，实际上就是对scan点集的优化。平台采用的是IMU测量方向，然后将其映射到2D平面上。在这篇论文的局部方法中，每个连续的点集被拿来和整个地图的一部分进行匹配，就是和submap进行匹配。使用一种非线性优化方法将submap和scan点集联系起来，这也是sacn matching过程。局部方法积累的误差在之后的第五部分的全局方法去掉。

### 3.1 scans

submap的构建是不断的校准点集和submap的坐标。文中将点集表示成H，这个scan点集在submap点集的位置被表示成

### 3.2 submaps

一个submap是由连续几个scans建立的，这些submap采用的是概率网格M，这个代表着离散网格点中概率值，这个值可以作为表示这个网格是否为障碍物的概率。对于每个网格点，论文中都定义了一个相应的像素，这个像素包含了所有靠近这个网格点的scan points。无论什么时候一个scan点集被插入到这个概率网格中，一个包含网格点的hits集合以及一个miss集合都会被重新计算。对于每一次的hit，我们将每个像素关联的网格插入这个miss集合，对于已经在hit集合中的网格点不需要插入。对于每一个之前没有观察到的网给点都会根据他们所在的几何是hit还是miss赋予一个概率值

如果一个网格点



## 3. 开源代码逻辑

Googal开源的代码主要包含两部分：cartographer和cartographer_ros。cartographer主要负责处理来自雷达、IMU和里程计的数据，并基于这些数据进行地图的构建，是cartographer理论的底层实现。cartographer_ros则基于ros的通信机制获取传感器的数据并将它们转换成cartogropher中定义的格式传递给cartographer处理，与此同时也将cartographer的处理结果发布用于显示或保存，是基于cartographer的上层应用。

## 4. cartographer代码结构

common：定义了基本数据结构以及一些工具的使用接口

sensor：定义了雷达数据及点云等相关的数据结构

transform：定义了位姿的数据结构及其相关的转换

kalman_filter：主要通过kalman滤波器完成对IMU、里程计及基于雷达数据的估计位姿的融合，进而估计新进的laser scan的位姿

mapping：定义了上层应用的调用接口以及局部submap构建和基于闭环检测的位姿优化等的接口

mapping_2d和mapping_3d：对mapping接口的不同实现























