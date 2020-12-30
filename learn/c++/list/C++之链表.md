# C++之链表

https://blog.csdn.net/slandarer/article/details/91863177?ops_request_misc

## 1. 怎么理解链表

就是说现在有一个小纸条，上面写着一个抽屉的地址，那个抽屉里面有一些你需要的东西，和一个新的写着地址的小纸条，这个小纸条又指向了一个新抽屉，大体可以这么理解

程序所包含的头文件

```cpp
#include <iostream>
#include <cstdlib>

using namespace std;
```

当然要做随机顺序链表的话，最好也包含ctime这个库

## 2. 第一部分：构建抽屉

既然把装有东西和写有地址的小纸条比作抽屉那么我们不妨先写出抽屉的结构体

```cpp
struct listpoint
{
    int data;
    listpoint* next;
};
```







