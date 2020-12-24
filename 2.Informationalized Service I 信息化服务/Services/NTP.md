# N T P

> **网络时间协议**（英语：Network Time Protocol，缩写：NTP）是在数据网络潜伏时间可变的计算机系统之间通过分组交换进行时钟同步的一个网络协议，位于 OSI 模型的应用层
>
> **时钟层**，分为四层，「时钟设备」 -直连- 「服务器」 -高速网络-  「服务器」 -连接- 「服务器」 - Internet 
>
>  （全球的计算机，可以连接公共的 NTP 服务自建局域网时间服务器同步）

### LAN Time Sync

分发时间同步，在使用者端（LAN）中表现为 CS 架构。

操作部分，搭建 LAN NTP  Server，手动（Linxu）或自动（AD）设定客户端与此服务器同步。

#### 1. AD NTP  Server

> 在 AD 域服务器中修改注册表实现，配合 GPO 设定和分发 LAN NTP Server 。实现 LAN 时间同步分发 NTP 准确时间；

#### 2. NTPD Server 

>组件：NTP Program、系统守护进程、Internet NTP DNS 、定时同步排程
>
>通过 Bash 配置 NTPD服务器，配合 AD 服务器实现 LAN 同步；或手动设定加入 NTPD Server（作为备选方法）

Notes：

小结：对于少量的主机 而言，可以使用 NTP Pools Servers ，或系统默认的时间服务器即可；

目的：就是为了系统同步正确的时间，并且是自动化的

注意点：跨时区同步可能还会存在少量的问题（比如 AD “跨时区”林的用户跨区登录）

### 附录

**Link**

1. ["私房菜"	-NTP Server](http://linux.vbird.org/linux_server/0440ntp.php)
2. [Linux NTP 教程（白话文）](https://blog.gtwang.org/linux/linux-ntp-installation-and-configuration-tutorial/)
3. [如何在 Windows Server 中配置权威时间服务器](https://support.microsoft.com/zh-cn/help/816042/how-to-configure-an-authoritative-time-server-in-windows-server)
4. [NTP Pool Servers](http://support.ntp.org/bin/view/Servers/NTPPoolServers)



