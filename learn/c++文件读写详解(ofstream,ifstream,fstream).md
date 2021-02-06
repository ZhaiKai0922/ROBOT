# c++文件读写详解(ofstream,ifstream,fstream)

## 1. 这里主要是讨论fstream的内容

```cpp
#include <fstream>
ofstream;       //文件写操作，内存写入存储设备
ifstream;        //文件读操作，储存设备读取到内存中
fstream;         //读写操作，对打开的文件可进行读写操作
```

### 1.1 打开文件

在fstream类中，成员函数open()实现打开文件的操作，从而将数据流和文件进行关联，通过ofstream,ifstream,fstream对象进行对文件的读写操作。

函数：**open()**

```cpp
//public member function

void open (const  char* filename, ios_base::openmode mode = ios_base::in | ios_base::out);
//filename：操作文件名  mode：打开文件的方式 
void open (const wchar_t* _Filename, ios_base::openmode mode = ios_base::in | ios_base::out, int prot = ios_base::_Openprot);     //prot：打开文件的属性，基本很少用到
```

### 1.2 打开文件的方式

打开文件的方式在ios类中定义，有如下几种方式：

```cpp
ios::in;            //为输入(读)而打开文件
ios::out;         //为输出(写)而打开文件
ios::ate;         //初始位置：文件尾
ios::app;        //所有输出附加在文件尾
ios::trunc;     //如果文件已存在则先删除该文件
ios::binary;   //二进制方式
```

这些方式是能够进行组合使用的，以“或”运算("|")的方式，如下所示：

```cpp
ofstream out;
out.open("Hello.txt", ios::in | ios::out | ios::binary);  //根据自己需求适当的选取
```

在很多程序中，可能会碰到ofstream out("Hello.txt")，ifstream in("......")，fstream foi("......")这样的使用，并没有显示的去调用open()函数就进行文件的操作，直接调用了其默认的打开方式，因为stream类的构造函数中调用了open()函数，并拥有同样的构造函数，所以在这里可以直接使用流对象进行文件的操作，默认方式如下：

```cpp
ofstream out("...", ios::out);
ifstream in("...", ios::in);
fstream foi("...", ios::in | ios::out);
```

当使用默认方式进行文件的操作时，你可以使用成员函数is_open()对文件是否打开进行验证。

### 1.3 关闭文件

当文件读写操作完成之后，我们必须将文件关闭以使文件重新变为可访问的。成员函数close()，它负责将缓存中的数据排放出来并关闭文件。这个函数一旦被调用，原先的流对象就可以用来打开为他的文件了，这个文件也可以重新被其他的进程所访问了。为防止流对象被销毁时还联系着打开的文件，析构函数将会自动调用关闭函数close()。

### 1.4 文本文件的读写

类ofstream, ifstream, fstream是分别从ostream, istream, iostream中引申来的。这就是为什么fstream的对象可以使用其父类的成员来访问数据。

一般来说，我们将使用这些类与同控制台交互同样的成员函数(cin和cout)来进行输入和输出。如下面的例题所示，我们使用重载的插入操作符<<:

```cpp
//writing on a text file
#include <fiostream.h>
int main(){
    ofstream out("out.txt");
    if(out.is_open())
    {
        out<<"This is a line .\n";
        out<<"This is another line .\n";
        out.close();
    }
    return 0;
}
```

