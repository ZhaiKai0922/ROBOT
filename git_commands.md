# git 相关指令

## 1.生成密钥

运行如下指令

ssh-keygen -t rsa -C 'youremail@example.com'

在用户主目录下的.ssh文件夹，会生成两个文件id_rsa，id_rsa.pub

![image-20201129101005456](/home/zk/.config/Typora/typora-user-images/image-20201129101005456.png)

其中id_rsa是私钥，不能泄露出去；id_rsa.pub是公钥，可以放心的告诉别人。

登录GitHub，打开右上角菜单栏，打开“settings”，“SSH Keys”页面；

然后，点"add SSH Key"，填上任意的title，在key文本框里面粘贴id_rsa.pub文件的内容。

添加完成后如下图所示，图片中我添加了两个Key。

![image-20201129101927739](/home/zk/.config/Typora/typora-user-images/image-20201129101927739.png)

## 2.拉取远程仓库到本地，并上传修改内容

下面先把远程仓库的内容克隆到本地

git clone git@github.com:xxxx/gitskills   

//这是克隆远程仓库到本地，目前仓库所有的分支已经克隆到本地，只不过默认只显示main一个分支

git branch -a

//查看所有分支，其中绿色表示本地当前分支，红色表示远程的分支

git checkout dev

//如果现在我们需要dev分支的内容，运行checkout指令切换到指定分支即可，此时文件夹中的内容会切换到dev分支的内容

下面你可以在dev分支里面做一些修改

你可以在dev分支下新建一个read.txt文档，添加几句话

修改完成后执行

git add read.txt

git commit -m "add read.txt" ///命令中“xxx”是添加的说明，用户可以自行修改

git push origin dev  //将本地仓库dev分支修改的内容推送到远程仓库，我们可以看一下远程仓库dev分支是否做了同样的改变

git checkout main //本地仓库切换到main分支，我们可以看到main分支下没有read.txt

git merge dev  //将dev分支合并到main分支，main分支相应添加了read.txt文档

git push origin main //将本地仓库main分支修改的内容推送到远程仓库，我们可以看一下远程仓库main分支的内容已经发生了改变

## 3.远程仓库产生更新，本地仓库进行同步更新

方法一：

git fetch origin dev

//创建并更新本地远程分支，即创建origin/dev分支，将远程仓库的dev分支代码拉取到到本地远程分支origin/dev上

git merge origin/dev

//将本地远程分支即origin/dev与当前所在的本地分支进行合并，这样你就看到本地仓库进行了更新

方法二：

git fetch origin dev:tmp

//在本地创建一个tmp分支，并将远程origin仓库的dev分支下的内容下载到tmp分支，这样本地仓库的创建的tmp分支就已经下载了最新的内容，与上面方法一有不同。

git diff tmp

//比较当前分支与新创建的tmp分支里刚下载的内容有什么不同

git merge tmp

//合并tmp分支到当前分支

git branch -d tmp

//如果不想保留tmp分支，使用这步进行删除

方法三：

git pull origin main

//拉取远程服务器的main分支到当前分支

## 4.其他一些常用指令

git init

//初始化

git status

//查看仓库状态

git log

//查看历史记录

git reset --hard HEAD^ 

//退回到上一个版本

git reset --hard 1094a 

//其中1094a表示id，可以退回到指定的id版本

git diff HEAD -- readme.txt

//比较readme.txt在工作区和版本库最新版本的区别

git checkout -- readme.txt

//让文件回到最近一次git commit,git add的状态，指令只适用于修改后还没有add与commit

git reset HEAD readme.txt

//如果已经add到缓存区，还没有commit，可以使用上面的指令，把缓存区的修改退回到工作区

git remote add origin git@github.com:xxx/gitskills.git

//本地的gitskills仓库与远程仓库gitskills进行关联

git push -u origin master

![image-20201129214524050](/home/zk/.config/Typora/typora-user-images/image-20201129214524050.png)

**markdown 语法：**

<img src="" width = "500" height = "300" alt="1" align=center />