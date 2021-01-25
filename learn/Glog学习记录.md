# GLog学习记录

## 1. 严重程度

GLog允许你制定消息的严重程度，一共有四个级别：INFO，WARNING，ERROR，FATAL。记录FATAL消息会终止程序(在记录消息之后)，在GLog记录的消息的开头以I、W、E、F来表示信息的严重级别。

## 2. 日志格式

默认情况下日志会写入本地/tmp/文件夹中，文件名格式：<program name>.<host name>.<user name>.log.<Severity level>.<date>-<time>.<pid>;

默认情况下，GLog还会将ERROR和FATAL错误记录到stderr消息中(会在终端中打印出来)；

在终端打印出来的消息格式：

<Serverity level><number> <time>.<number> <pid><file>:<line number> <message>

**示例程序及编译：**

```cpp
#include <glog/logging.h>
int main(int argc, char** argv)
{
    google::InitGoogleLogging(argv[0]);  //初始化GLog库
    LOG(ERROR)<<"There is error !!!";
    return 0;
}
```

```cpp
//用g++进行编译 -lglog -lgflags 为两个依赖库
g++ glog_test.cpp -o glog_test -lglog -lgflags
./glog_test
```

**终端打印：**

![image-20210125113623050](/home/zk/zk/ROBOT/learn/image-20210125113623050.png)

同样可以在本地/tmp/文件夹下查看日志内容

## 3.设置

- **设置存放Log的目录**

如果我们想指定log文件输出位置，那么我们可以对GLog设置一下标志(FLAGS_log_dir);

```cpp
#include <glog/logging.h>
int main(int argc, char** argv)
{
    google::InitGoogleLogging(argv[0]);  //初始化GLog库
    FLAGS_log_dir = "./";    //将日志文件输出到当前文件夹下
    LOG(ERROR)<<"There is error !!!";
    return 0;
}
```

在当前文件夹就会产生日志文件，日志文件有四个基本文件。

- **设置只在终端显示Log**

当我们只想将日志信息输出到stderr，在终端中显示的时候，我们可以设置(FLAGS_logtostderr);

设置 **FLAGS_logtostderr = 1** 将使日志信息记录到stderr而不保存到本地日志文件中，即使你设置了FLAGS_log_dir;

此次日志信息显示包含所有级别，即INFO、WARNING、ERROR、FATAL；即使采用下面方式，设置记录到终端的log级别，也会被忽略。

- **设置记录到本地，并且在终端显示**

设置 **FLAGS_alsologtostderr = 1** 将实现日志信息在终端显示，此次日志信息显示包含所有级别，即INFO、WARNING、ERROR、FATAL;

即使采用下面方式，设置记录到终端的log级别，也会被忽略。

- **设置记录到终端的log级别**

这仅仅是对于记录Log到终端中的设置；

当我们需要将WARNING等级的log记录到终端时，我们可以设置**FLAGS_stderrthreshold=1** 那么WARNING以及更高级别的Log会记录到终端中，默认情况下只显示ERROR以及更高级别；

INFO:0，WARNING:1，ERROR:2，FATAL:3

## 4. 条件记录

我们可以使用LOG_IF()来达到有条件输出日志的目的；

```cpp
#include <glog/logging.h>
int main(int argc, char **argv) {
    google::InitGoogleLogging(argv[0]);      // 初始化GLog库
    FLAGS_logtostderr = 1;                                //设置只在终端打印，即终端打印出全部信息，则下面lod_dir与stderrthreshold设置可以忽略。
    FLAGS_log_dir = "./Log";
    FLAGS_stderrthreshold = 1;
    FLAGS_colorlogtostderr = 1;                     //终端打印颜色设置


    LOG(INFO) << "There is info";
    LOG(WARNING) << "There is warning";
    LOG(ERROR) << "There is error !!!";
    LOG(WARNING) << "There is another warning";

    for(int i=0; i<20; i++)
    {
            LOG_IF(INFO, i>15)<<i<<">15";         //当i>15时，记录Log
    }

    return 0;
}

```

**终端显示的Log：**

![image-20210125230558340](/home/zk/zk/ROBOT/learn/image-20210125230558340.png)

## 参考链接

https://blog.csdn.net/weixin_30954265/article/details/95081357

https://blog.csdn.net/qq_34347375/article/details/86629421

