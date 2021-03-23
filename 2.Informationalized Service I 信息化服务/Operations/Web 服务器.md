# Web Server

本文章基于 Web Server 的占有率作为出发点，商用的服务是它们“保持运行活动”的开始，一下包含三个 Web Server ：Apache、Nginx、IIS

> [Web Server -titile市场占有率	--wiki](https://zh.wikipedia.org/wiki/網頁伺服器#市場佔有率)

新认识一项服务，可以从它的“ ROOT ”开始

## 1. Apache

Apache 是一个 HTTP 服务器基于网络 TCP/IP 的协议

**模块化（或组件化）**

![image](http://mlyan.top//images/apache_yunxing.png)

**工作模式**

只是说明了进程与线程之间的调度和优化形成的模式

- Prefork 的进程与线程：主进程	-	子进程	-	单线程

- Worker ( MPM )  的进程与线程：主进程	-	子进程	-	多线程（监听、More）

- Event MPM 的进程与线程：主进程	-	子进程	-	多线程（监听、管理、分配）

它们之间的比对（启动流程、优势、应用环境）如下链接

> 1.[Apache 运行机制（Apache 系统模式之间的比对）](https://www.dazhuanlan.com/2020/01/17/5e216bd5f0c17/?__cf_chl_jschl_tk__=5e465ab943259955151b9c712e695282f14fb202-1585808544-0-AQXj60kO6vjjuGxgm8mbPOrFB15nv-AwQECiNMlpXgC42kWK4buuY4TIUgle4GQpsZLy5RqrUH3iXa8cGfXqV0jqNzx5rihfVxZHkJ3o0vQOaGS21TSIF_q3d88uhWvR4LNDe1hA1wodSsupPtWXTQ6HfQCC6YdnSBCKdAK9qTippVCVGYDisS0P1W1S5MiDlUo2x0KlPFlV-fgzhCtIMbTtEnzC4HxK9TygVYVtYN3f0kdkD4qDGjh0Xe4ZQFE1OF29S3TtCEc_pNuq-mi_do0Cl3fd-c203AYcV2EgIg9VLs1wmrEdMMPB7cj0CLxWkg)	-- 2020-01-17 Blog
>
> 2.[Apache 运行机制剖析](https://littlewhitejing.github.io/2018/04/24/apache-1/)	--2018-04-24 Blog

## 2. Nginx

此处留空（None）

> [Nginx 架构](http://www.mikewootc.com/wiki/sw_develop/web/nginx_arch.html)	--2017.02.16 Blog
>
> [Nginx](https://zh.wikipedia.org/wiki/Nginx)	--Wiki

## 3. IIS

再次留空

## 附录

**Web  Sever**

> 1.[Apache](https://www.apache.org/)
>
> 2.[Nginx](https://www.nginx.com/)
>
> 3.[IIS	--Microsoft](https://www.iis.net/)



