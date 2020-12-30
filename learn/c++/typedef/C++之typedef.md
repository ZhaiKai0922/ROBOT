# C++之typedef

**typedef主要有下面三个用途**：

## 1. 定义一种类型的别名

定义一种类型的别名，而不只是简单的宏替换。可以用作同时声明指针型的多个对象。

```cpp
//比如：
char* pa, pb;  //这多数不符合我们意愿，它只声明了一个指向字符变量的指针和一个字符变量
typedef char* PCHAR;  //一般用大写
PCHAR pa, pb;  //可行，同时声明了两个指向字符变量的指针

char *pa, *pb;  //当然这个也是可行的，但是没有用typedef的形式更加直观，尤其在需要大量指针的地方，typedef的方式更加便利。
```

## 2. 过去代码中常使用的一种形式

在使用旧的C时，声明struct新的对象时，必须要带上struct，即形式为：struct+结构名+对象名

```c#
struct tagPOINT1
{
    int x, y;
};
struct tagPOINT1 p1;  //形式为：struct+结构名+对象名
```

而在C++中，则可以直接写：结构名+对象名 即：

```c++
tagPOINT1 p1;  //形式为：结构名+对象名
```

估计有些人觉得经常多写一个struct太麻烦了，于是就发明了下面：

```cpp
typedef struct tagPOINT
{
    int x, y;
}POINT;
POINT p1;  //这样就比原来的方式少了一个struct，在大量使用时比较便利
```

或许，在C++中，typedef的第二种用途作用不大，但是了解它，对于掌握旧代码还是很有帮助的，毕竟我们需要“参考”很多的旧代码~

## 3. 用typedef来定义与平台无关的类型

```cpp
//比如定义一个叫REAL的浮点类型，在目标平台1上，让它表示最高精度的类型为：
typedef long double REAL;

//在不支持long double的平台2上，改为：
typedef double REAL;

//也就是说，当跨平台时，只要改一下typedef本身就好，无需再对源码就行修改
//标准库就广泛使用了这个技巧，比如size_t
//另外，因为typedef是定义了一种类型的新别名，不是简单的字符串替换，所以它比宏来得稳健
```

## 4. typedef 与 #define 的区别

### 案例：

通常讲，typedef要比#define要好，特别是在有指针的场合。请看例子：

```cpp
typedef char* pStr1;
#define pStr2 char*;
pStr1 s1, s2;
pStr2 s3, s4;
//在上述变量定义中，s1,s2,s3都被定义为char*，而s4则被定义成了char，不是我们所预期的指针变量，根本原因就在于#define只是简单的字符串替换，而typedef则是为一个类型起一个新的名字
```

















