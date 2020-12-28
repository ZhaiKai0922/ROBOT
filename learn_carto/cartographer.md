# cartographer

https://scholar.chongbuluo.com/　　(百度学术)

https://blog.csdn.net/LilyNothing/article/details/60875825　　(论文翻译)

https://blog.csdn.net/weixin_36976685/article/details/89204034　　(源码解析1.1－算法整体结构)

https://zhuanlan.zhihu.com/p/27631583　　(SLAM源码分析)

---

## 1. 相关工作

这里涉及到几种匹配算法：

scan to scan matching:会累计误差，最终误差会很大

scan to map matching:减少了误差的累计（本篇论文使用的方法）

pixel accurate scan matching:最后有说这个算法在后台应用于将scan点集和最近的submap进行匹配，生成loop closing的约束条件。

解决局部误差的累计，有两种方式：一种是粒子滤波法，一个基于图SLAM方法