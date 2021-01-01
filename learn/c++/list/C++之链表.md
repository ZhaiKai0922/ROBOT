# C++之链表

https://blog.csdn.net/slandarer/article/details/91863177?ops_request_misc

## 怎么理解链表？

就是说现在有一个小纸条，上面写着一个抽屉的地址，那个抽屉里面有一些你需要的东西，和一个新的写着地址的小纸条，这个小纸条又指向了一个新抽屉，大体可以这么理解

程序所包含的头文件

```cpp
#include <iostream>
#include <cstdlib>

using namespace std;
```

当然要做随机顺序链表的话，最好也包含ctime这个库

## １. 构建抽屉

既然把装有东西和写有地址的小纸条比作抽屉那么我们不妨先写出抽屉的结构体

```cpp
struct listpoint
{
    int data;  //这是一个数字，也就是抽屉里存放的东西
    listpoint* next;  // 这是一个指向新抽屉的指针
};
```

这就是一个简单的结构体

我们可以在抽屉里面放下一个抽屉的指针，自然也可以放上一个抽屉的指针：

```cpp
struct listpoint
{
    int data;
    listpoint* next;
    listpoint* last;
};
```

我们在抽屉里不仅仅可以放一个数，我们可以往里面放一个收纳盒，例如，在下面的结构体中包含了另一个结构体

```cpp
struct data
{
    int number;
    string name;
    string sex;
}
struct listpoint
{
    data* information;
    listpoint* next;
    listpoint* last;
}//那个叫做information的小收纳盒装着一个人的学号，姓名，性别等信息
```

## 2. 创建一个链表

### 2.1 创建一个基础链表

```cpp
listpoint* create_normal_list(int n)
//链表每一个节点都是指向listpoint结构的指针，所以返回值是listpoint*，其中n是指创建的链表的节点数目
{
    listpoint* head, *normal, *end;  //创建头节点，其他节点，尾节点
    head=(listpoint*)malloc(sizeof(listpoint));  //分配内存
    head->information=(data*)malloc(sizeof(data));  //分配内存
    
    end=head;  //最开始最后一个节点就是头节点，注意因为通过指针可以直接对地址上的东西进行操作，此时end与head指向同一个地址
    
    for(int i=0;i<n;i++)
    {
        normal=(listpoint*)malloc(sizeof(listpoint));//给新节点分配内存
        normal->information=(data*)malloc(sizeof(data));
        cout<<"intput the number:";
        cin>>normal->information->number;  //往新节点存入数据，注意我们只给后面的节点存入数据
        cout<<"input the name:";　　　　　　 //head节点不存数据
        cin>>normal->information->name;
        cout<<"input the sex:";
        cin>>normal->information->sex;
        cout<<"---------------------"<<endl;
        
        end->next=normal;                  //往end后增添新节点
        normal->last=end;                  //新节点的上一个节点就是end
        end=normal;                        //让新节点变成end节点
    }
    end->next=NULL;                        //链表的最后next为空指针
    head->last=NULL;                       //链表的开始last为空指针
    return head;
}
```

### 2.2 创建环状链表

操作与之前一样，只不过最后一个节点的next指向头节点





















