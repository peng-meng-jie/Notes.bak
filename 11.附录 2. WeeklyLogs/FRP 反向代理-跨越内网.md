# FRP反向代理-跨越内网

基于FRP服务的局域网反向代理至外网设备

核心（FRP）服务https://github.com/fatedier/frp/releases
说明：反向代理的“window远程控制”。以下是Window平台的内网反向代理（“Windows远程控制”）示例。

## 一、搭建 FRP Service端

1.解压FRP，找到frps.ini文件并打开
2.编辑其内容为

```python
bind_port = 7000
# dashboard_user = 172.0.0.1
dashboard_port = 7500
dashboard_user = admin (username)
dashboard_pad = admin (password)
```

3.代码补充说明：需要绑定系统端口（上面是7000）。中间部分可忽略，最后部分Web管理器的用户名和密码（访问保护）。
在当前文件夹运行PowerShell，输入frps  -s  frps.ini并运行
4.在浏览器中输入：172.0.0.1：7000并访问（可访问即架设成功），输入用户名和密码

## 二、搭建 FRP Client端

1.解压FRP，找到frpc.ini文件并打开
2.编辑其内容为

```python
[common]
server_addr = 192.168.33.115(例子)
server_port = 7000
[ssh]
type = tcp
local_ip = 172.0.0.1
local_port = 3389
remote_port = 7001
```


3.在当前文件夹运行PowerShell，输入frpc  -s  frpc.ini并运行
4.开启Window系统中远程访问权限

## 三、实现远程连接

1.打开windows的远程访问，输入“172.0.0.1:7001”（即客户端IP＆Port端口）

2.点击连接，登陆目标电脑的账号和密码即可

## 附录

###  FRP架构图

文字版：user --> frps with public IP adderss  --> frpc/frps(tcp/http)

[FRP GitHub projects](https://github.com/fatedier/frp/blob/master/README_zh.md)