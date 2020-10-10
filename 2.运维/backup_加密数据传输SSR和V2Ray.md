# 加密数据传输

以Shadowsocks、V2Ray 为例

## 1. 导读

**需求**

网络安全性、反网络监听、突破”防火墙“等

**原理 <sup>[1]</sup>**

[加密](https://zh.wikipedia.org/wiki/加密)，让审查系统无法判断你在浏览什么内容。

[代理](https://zh.wikipedia.org/wiki/代理)，与第三方能正常访问被封锁的信息的[代理服务器](https://zh.wikipedia.org/wiki/代理服务器)创建连接，以连接到未经审查地区的计算机，以间接的形式绕过审查设备访问互联网

[伪装](https://zh.wikipedia.org/wiki/偽裝)，将真实的信息混淆在其他信息当中，实现网络流量的伪装。

**相关网络的协议**

V2Ray、Socks、HTTP、Shadowsocks、VMess等	

## 2. Shadowsocks Server

数据加密代理，“穿透防火墙”进行连接

Note：建议使用代理链接，不要直接暴露本机IP

### 2.1 Service build

#### 1. Windows

**基本的软件/技术支持**：SRR源代码一份、openssl、python

提醒：openssl、python基本为自动化安装，但是openssl需要注意“系统变量（Path）”和安装目录（openssl/bin）中的DLL文件：libcrypto、libssl文件后面的1-1后缀。

确认安装检查PowerShell：python -V、openssl，能进入即可。

**SSR service run**： 解压ssr源代码，run Powershel

```powershell
PS: python server -c ./config.json
# config.json 配置参数、加密类型请查阅Google
```

注意：如果缺少插件请使用pip install “SomePackage”，以及MySQL辅助支持

Note：不建议使用Windows搭建SSR代理服务器

#### 2. Liunx

基础的软件/技术支持：Liunx bash、git、ssr源代码、System防火墙and自启动

更多信息请自行 Google 后进行自行搭建

#### 3. VPS

基于以上的service搭建方法，自行搭建VPS，

！Notes：云主机视自身需求进行租借

### 2.2. Shadowsocks client

几乎极致的全平台客户端，Android、IOS、Liunx、Windows等

详见Github各个分支 ( Google:	ssr cilent site:github.com )

## 3. Project V（V2Ray）



## 4. 附录

**注解**

[1] [突破网络审查 --Wiki]([https://zh.wikipedia.org/wiki/%E7%AA%81%E7%A0%B4%E7%BD%91%E7%BB%9C%E5%AE%A1%E6%9F%A5#%E4%BB%A3%E7%90%86%E6%9C%8D%E5%8A%A1%E5%99%A8](https://zh.wikipedia.org/wiki/突破网络审查#代理服务器))

**相关链接**

1.[Project V](v2ray.com)

2.[Shadowsocks Github](https://github.com/shadowsocks)





