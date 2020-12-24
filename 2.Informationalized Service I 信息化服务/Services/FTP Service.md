# FTP Service

基本可以解决上传和下载的需求

## 1. FTP

**概念**

文件传输协议,基于网络底层的TCP协议；

市面上有许多基于此协议的软件或文件服务;

核心概念:	上传/下载;

### 1.1 运行机制

基于"C/S架构"的网络服务;

运行机制:  ① client发送请求; ② server执行client请求内容并返回相应的数据; 

​					③ client接收数据并保留到本地计算机;

FTP会话的TCP连接，主动模式：20/21

​	① 控制模式使用 TCP port 21,处理命令信息(用户名/密码);

​	② 数据模式使用TCPport 20, 只处理上传/下载;

### 1.2 连接与传输

数据的连接, 分为主动和被动模式;

数据的传输, 分为ASCII模式（文本序列）和Binary（二进制）模式;

### 1.3 主动与被动模式

主动模式的运行机制与缺点

``` markdown
# 运行机制 C/S
C to S pass 21port
C send order(包含需求信息) to S
S link C port发送数据到C

# 缺点(优+/劣-)
S+/C-, 因为FTP服务器企图与客户端的高位随机端口建立连接，而这个端口很有可能被客户端的防火墙阻塞掉。
```

被动模式的运行机制与缺点


```markdown
# 运行机制(与主动模式相同)
C 提交PASV命令
S 开启非特权port并发送会给C
C 发起本地端口连接S port传输数据

# 缺点(优+/劣-)
S-/C+, 因为客户端要与服务器端建立两个连接，其中一个连到一个大于1024的随机端口，而这个端口很有可能被服务器端的防火墙阻塞掉。
```

Notes: 如何配置被动模式的防火墙规则，清查阅关于iptables的文章

### 1.4 用户类型(待补充)

匿名用户

本地用户

虚拟用户

## 2. 搭建 FTP service

### 2.1 临时的FTP

**Python**

基于Python进行搭建临时的FTP文件服务器

Server (Python3.7+):	python -m http.server  8000

> 绑定IP	--bind  172.0.0.1
>
> 绑定port	pyhton -m http.server 8000
>
> 绑定文件夹	--directory FilePath

Client:	http:// your IP, 在web中输入此地址即可访问并且下载;

https://docs.python.org/3/library/http.server.html

### 2.2 Window

1.控制面板>程序>启用或关闭Windows功能, 开启Windows FTP功能

2.添加IIS服务, 并绑定共享的文件夹，设定好相关的配置/模式

3.window防火墙设定为允许FTP服务

Notes: [DNS for Windows --dns](https://blog.csdn.net/qq_34610293/article/details/79210539)

### 2.3 Liunx-vsftpd

设定配置/自动管理/防火墙配置/用户配置等

Notes:	Bash: man vsftpd/ Urls: [vsftpd conf](http://vsftpd.beasts.org/vsftpd_conf.html)

### 2.4 客户端

Web:	ftp://username@yourIP

使用各平台的开源/免费的客户端, 如 [FileZilla](https://filezilla-project.org/)



