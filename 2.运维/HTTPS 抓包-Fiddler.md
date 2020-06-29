# HTTPS抓包-Fiddler（Windows）

**简介**：Fiddler是位于客户端和服务器端的HTTP代理，也是目前最常用的http抓包工具之一 。 它能够记录客户端和服务器之间的所有 HTTP请求，可以针对特定的HTTP请求，分析请求数据、设置断点、调试web应用、修改请求的数据，甚至可以修改服务器返回的数据，功能非常强大，是web调试的利器

**核心功能**：【（浏览器---->/Fiddler（https）代理/-->）-->服务器】

## 1.Fiddler ”简化“手册

**1.1软件主要分为四个功能面板**

1.菜单面板：保存记录、功能、视图设定等

2.工具面板：快捷方式栏，如：快捷控制Session数据工具

3.Https session 面板：记录每一个请求或放回的session记录

4.数据详细面板：查看单一或全部请求的纤细数据

**1.2 session 面板**

顶部对应title标题

![img](http://blog.poetries.top/img-repo/2019/10/189.png)

HTTP/HTTPS请求图标

![img](http://blog.poetries.top/img-repo/2019/10/191.png)

## 2.功能

**2.1 statistic 分析**

在详情面板中可以找到

可分析：DNS, TCP/IP, web资源解析比率等

**2.2 反向代理**

即修改service端返回的数据,直接对HTTPS数据进行修改

1.在session面板中，鼠标右键-选择"unlock for editing"的功能

2.选择Fiddler右侧reponse块下的TextView，这里修改需要修改的div或title

3.在详情面板的"AutoResponded"中开启checkbox,添加相应的Rule(即urls)

4.到工具面板中设置:performance-simulate Modem Speeds即可

**2.3 模拟低速网络环境**

工具面板: 开启performance-simulate Modem Speeds  即可

**2.4 代理系统 Hosts解析**

点击tools>>hosts,在里面填写自己想要设置的host即可

**2.5 辅助工具**

1.对于session面板,可过滤urls请求

2.解析乱码的html,使用decode功能即可

<u>3.更多的应用和使用场景,请浏览官方网站</u>

## 3.Attachment

**1. 用途方向补充**

1.如QQ邮件（Web端口）访问缓慢，可以解析访问DNS、TCP/IP、text/html、jpge的解析时间

2.代理https，可以控制访问发送和返回的数据（监控数据）

3.网络不稳定模拟，可以重现应用场景

**2. 参考文档**

[1. poetries Blog](https://blog.poetries.top/2017/11/04/fiddler/)

[2. Fiddler](https://www.telerik.com/fiddler)

[3. 知道创宇](https://blog.knownsec.com/Knownsec_RD_Checklist/v3.0.html)

