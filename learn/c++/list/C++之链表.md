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
    char name[10];
    char sex[10];
};
struct listpoint
{
    data* information;
    listpoint* next;
    listpoint* last;
};//那个叫做information的小收纳盒装着一个人的学号，姓名，性别等信息
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

```cpp
listpoint* creat_loop_list(int n)
{
    listpoint* head,*normal,*end;
    head=(listpoint*)malloc(sizeof(listpoint));
    head->infomation=(data*)malloc(sizeof(data));
    end=head;
    for(int i=0; i<n; i++)
    {
        normal=(listpoint*)malloc(sizeof(listpoint));
        normal->information=(data*)malloc(sizeof(data));
        cout<<"intput the number:";
        cin>>normal->information->number; 
        cout<<"input the name:";　　　　　　 
        cin>>normal->information->name;
        cout<<"input the sex:";
        cin>>normal->information->sex;
        cout<<"---------------------"<<endl;
        
        end->next=normal;
        normal->last=end;
        end=normal;
    }
    end->next=head;                             //环状链表这里与前面基础链表不同
    head->last=end;
    return head;
}
```

## 3. 修改链表

### 3.1 修改数据

**因为我们通过指针可以直接修改地址储存的信息，所以函数并不需要返回值**

```cpp
void change_point(listpoint* list, int n, data* ifmation)
{
    listpoint* p;
    p=list;
    for(int i=0, i<n, i++)
    {
        p=p->next;
    }
    p->information=ifmation;
}
```

### 3.2 删除节点

```cpp
void delete_point(listpoint* list, int n)
{
    listpoint* p;
    p=list;
    for(int i=0, i<n, i++)
    {
        p=p->next;
    }
    p->last->next=p->next;
    p->next->last=p->last;
    free(p);
}
```

### 3.3 插入节点

```cpp
void insert_point(listpoint* list, int n, data* ifmation)
{
    listpoint* p;
    p=list;
    for(int i=0; i<n; i++)
    {
        p=p->next;
    }
    listpoint* insertpoint;
    insertpoint=(listpoint*)malloc(sizeof(listpoint));
    insertpoint->information=ifmation;
    insertpoint->last=p;
    insertpoint->next=p->next;
    p->next->last=insertpoint;
    p->next=insertpoint;
}
```

### 3.4 搜寻节点

```cpp
listpoint* search_point(listpoint* list, int n)
{
    listpoint* p;
    p=list;
    for(int i=0; i<n; i++)
    {
        p=p->next;
    }
    return p;
}
```

## 4. 输出数据

### 4.1 输出单个节点数据

```cpp
void output_point(listpoint* point)
{
    cout<<"The number is:"<<point->information->number<<endl;
    cout<<"The name   is:"<<point->information->name<<endl;
    cout<<"The sex    is:"<<point->information->sex<<endl;
    cout<<"----------------------------"<<endl;
}
```

### 4.2 输出整个链表数据

```cpp
void output_list(listpoint* point)
{
    listpoint* p;
    p=point;
    cout<<endl;
    while((p=p->next)!=NULL)
    {
        output_point(p);
    }
}
```

### 4.3 输出部分链表m点到n点

```cpp
dvoid output_list_part(listpoin* list, int m, int n)
{
    int difference=n-m;
    listpoint* p;
    p=list;
    for(int i=0; i<m; i++)
    {
        p=p->next;
    }
    for(int i=0; i<difference; i++)
    {
        output_point(p);
        p=p->next;
    }
}
```

## 5. 完整代码

```cpp
#include <iostream>
#include <cstdlib>
using namespace std;

struct data
{
    int number;
    char name[10];
    char sex[10];
};
struct listpoint
{
    data* information;
    listpoint* next;
    listpoint* last;
};

listpoint* creat_normal_list(int n)
{
    listpoint* head, *normal, *end;
    head=(listpoint*)malloc(sizeof(listpoint));
    head->information=(data*)malloc(sizeof(data));
    end=head;
    for(int i=0; i<n; i++)
    {
        normal=(listpoint*)malloc(sizeof(listpoint));
        normal->information=(data*)malloc(sizeof(data));
        cout<<"input the number :";
        cin>>normal->information->number;
        cout<<"input the name   :";
        cin>>normal->information->name;
        cout<<"input the sex    :";
        cin>>normal->information->sex;
        cout<<"-----------------------------"<<endl;
        end->next=normal;
        normal->last=end;
        end=normal;
    }
    end->next=NULL;
    head->last=NULL;
    return head;
}

void output_point(listpoint* point)
{
    cout<<"The number is :"<<point->information->number<<";";
    cout<<"The name   is :"<<point->information->name<<";";
    cout<<"The sex    is :"<<point->information->sex<<";"<<endl;
}

void output_list(listpoint* list)
{
    listpoint* p;
    p=list;
    while((p=p->next)!=NULL)
    {
        output_point(p);
    }
}
//**********************************************************
int main()
{
    listpoint* head;
    head=creat_normal_list(2);
    output_list(head);
    return 0;
}

```

## 6. 运行结果

创建两个节点，输入两节点相应data数据，最后打印出两节点内容：

![image-20210104204831514](/home/zhx/zk/ROBOT/learn/c++/list/image-20210104204831514.png)

## 7. C++中list用法

### 7.1 list中常用的函数

```cpp
//list中的构造函数
list();              //声明一个空列表
list(n);             //声明一个有n个元素的列表，每个元素都是由其默认构造函数T()构造出来的
list(n,val);         //声明一个有n个元素的列表，每个元素都是由其复制构造函数T(val)得来的
list(first,last);    //声明一个列表，其元素的初始值来源于由区间所指定的序列中的元素

push_back();         //使用list成员函数push_back和push_front插入一个元素到list中
push_front();        //push_back从list的末端插入，push_front实现从list的首端插入

empty();             //利用empty()判断list是否为空

clear();             //清空list中所有函数

front();             //通过front()可以获得list容器中的头部元素
back();              //通过back()可以获得list容器的最后一个元素

pop_back();          //通过pop_back()删除最后一个元素
pop_front();         //通过pop_front()删除第一个元素

assign();            //具体和vector中的操作类似，也是有两种情况
l1.assign(n, val);   //将l1中的元素变为n个T(val)
l1.assign(l2.begin(), l2.end()); //将l2中的从l2.begin()到l2.end()之间的数值赋给l1

swap();              //交换两个链表，一个是l1.swap(l2);另外一个swap(l1,l2)，都可以完成两个链表的交换

reverse();           //通过reverse()完成list逆置

merge();             //合并两个链表并使之默认升序（可更改），l1.merge(l2, greater<int>());调用结束后，l2变成空，l2元素包含原来的l1,l2的元素，并且排好序，升序。
```

### 7.2 程序示例

https://blog.csdn.net/yas12345678/article/details/52601578

















