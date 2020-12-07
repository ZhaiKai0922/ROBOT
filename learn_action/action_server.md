action server编写

service消息有两个区域

- request
- response

action消息有三个区域

- goal
- result
- feedback

以下是本例中创建的一个action消息

先进入到action文件夹，创建一个forward.action的文件

![image-20201207185739812](/home/zhx/.config/Typora/typora-user-images/image-20201207185739812.png)

![image-20201207185818530](/home/zhx/.config/Typora/typora-user-images/image-20201207185818530.png)



server提供一个实时的反馈，client可以在进行一半时可以退出

goal是请求

status、result（只能传一次）、feedback（多次传递）

http://wiki.ros.org/actionlib/Tutorials























