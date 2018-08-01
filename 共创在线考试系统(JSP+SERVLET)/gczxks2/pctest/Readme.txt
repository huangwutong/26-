这是一个JSP在线考试系统，后台数据库为MySQL。这是一个完整的web应用程序，实现了教师出题、学生在线考试(自由测试、单元测试、模拟考试)、错题本，以及相关的系统维护功能。在线测试的功能主要包括三部分：教师出题、学生在线考试和系统维护：系统维护包括对年级科目、知识点和模拟考试这些信息的维护，包括对相关内容的查看、添加和删除，并保持这些信息间的内部关联；教师试题录入模拟包括录入自由测试、单元测试、和模拟考试的试卷，并可以对系统中的试卷或试题进行修改； 学生在线考试模块包括自由测试、单元测试、模拟测试、考试成绩和错题本这些功能模块。 我目前已经完成了原型，基本程序在Windows 2000和Linux 7.2中，使用Tomcat 5.0进行了缜密的测试，目前可以良好地运行。但就功能来说还要进行更多的完善。我十分希望得到您的反馈信息，我的邮箱为hero_chengbd@163.com,　QQ为：52599893

CheckUser.jsp  检查用户口令
login.jsp  用户登录
pic.jsp  上传图片



这是我自己编写的一个在线测试系统，功能应该是比较全面了，当然还有扩展的余地。
您可以将我的代码用于非商业目的。我在这里将它发布到网上，是为了感谢我在开发时
从网上得到的网友们的众多支持。所以，如果您的代码参考了我的程序，请您也把相应的代码发给我，或与我联系。让这个系统能更加完善。我的邮箱是hero_chengbd@163.com, QQ是：52599893。由于一些原因，如果您还需要我进一步的帮助，我现在只能为您提供有偿服务。

1.Doc目录下有一份简单的说明文档，和一个数据库文件。我的系统使用了mysql 4.0，您需要在mysql创建一个名叫jinghua的数据库，再将jh003.sql这个文件导入到库中就可以使用了。这个jh002.sql中包含了数据库结构和一些基本的数据。
数据库安装说明（唉，有些网友实在不想自己搞，只好自己动手写吧）
1.1新建立一个名为jinghua的数据库（这个自己查吧，也算个小考验）
1.1.1在Dos环境中进入mysql的bin目录下，输入mysql＋回车这个命令，进入它的命令行环境
1.1.2在命令行中输入create database jinghua; (注意后面要有一个;号），来创建一个数据库
1.1.3输入quit＋回车，以退出命令行，回到DOS
1.2将jh003.sql复制到mysql\bin下
1.3在Dos状态的mysql\bin目录中输入mysql jinghua<jh003.sql 
1.4等待程序完成后，若不提示出错，则导入成功

2.导入数据库用：导入数据库：mysql jinghua<jh002.sql 这个命令(具体用法请查阅手册)。
3.系统的首页面为login.jsp，学生帐号之一为stest,口令是123; 教师帐号之一为t11，口令为123
4.程序中有关相关路径的设置：(不用设置也行，但可能无法显示图片）
	我的程序是安装在D:\JavaApp\Jinghua\test_online这个目录下的，您要是把web目录设置为这个，
　您就不必设置目录了，否则要修改JinghuaConn.java中的第24,25行，将rootpath设置为您的
　web应用程序的目录，将chartPath设置为：web应用程序的目录\chart\temp

5.试题中的公式可以用图片来显示，在录入时需要用程序把图片提交到一个目录中，我的web应用程序的目录是　D:\JavaApp\Jinghua\test_online，提交的图片保存在了D:/JavaApp/Jinghua/test_online/editor/pic中，如果你使用了不同的路径，请修改D:\JavaApp\Jinghua\test_online\editor\SimpleUpload.jsp中图片下载的路径为：
  <jsp:setProperty name="upBean" property="folderstore" value="D:/JavaApp/Jinghua/test_online/editor/pic" />

6.我是这样配置Tomcat 5的：
　我的web应用程序的目录是　D:\JavaApp\Jinghua\test_online
  在Server.xml中增加（具体位置请参考手册）：
<Context path="/jinghua" docBase="D:\JavaApp\Jinghua\test_online" debug="0" reloadable="true"/>
　
　好了，输入http://localhost:8080/jinghua/login.jsp 就可以看到登录页面了！