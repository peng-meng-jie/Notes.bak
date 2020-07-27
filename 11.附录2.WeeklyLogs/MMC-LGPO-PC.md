#### MMC-LGPO-PC

全程：Microsoft Management Console -Local Group Policy Objects - Public Computer，简单的描述就是基于微软管理插件和策略组对一些特殊要求的公共主机进行管控。

风险低，可用于测试 LGPO 而又不会对管理造成额外的影响，也可限制指定的用户达到一定的安全性要求。另外 AD GPO 也可以做到而且效果更好（易于管理），此文章应用于无域环境的需求。

应用方向：保护数据和可控的前提下分享主机，即公共电脑，或者设定相关的安全性和要求已到达企业信息安全；

##### 1. 对象

基于主机 

可以是 AD 域、局域网或工作站，条件就是主机和系统版本最好一直，建议在原始设备上创建和测试无需考虑版本的兼容性问题；

在主机的基上选择用户

基于用户使用于工作站的公开主机和隐私性的需求。

##### 2. LGPO

本条目主要讨论 LPGO 或非域环境的 GPO 配置与测试；

```markdown

管理员、普通用户、MMC、LGPO；
创建一个普通的用户用于应用环境
1. Powershell or cmd
Start command PS> compmgmtlauncher
Computer > Local user and Group > User ，create new user
注意：不要创建管理员账号

2. Start MMC
PS> mmc
2.1 File > Add or Removw Snap-ins 
2.2 Add Computer Management and GPOE
注意：添加 GPOE 后选择浏览到本地计算机或网络计算机、或 AD 域主机，本地计算机支持选择单个用户；

3. Set LGPO
根据相关的需求，限制该用户或主机的访问控制、软件控制、桌面控制等等一系列微软已开发的接口。
一个微型单机工作站 GPO 应用从此开始；

4. 迁移相关思路
把它移动至目标主机，使用管理员编辑该插件，重新导入主机用户即可；

```

##### 3. 扩展更多

###### 3.1 Service

定制化系统服务，可默认关闭一些不需要的服务，比如打印机的服务设为默认关闭。

###### 3.2 Task

创建定时任务，可以搭配 Powershell、BAT 的脚本处理，或者是一些指定的应用程序。比如强制用户注销或定时清理文件均可以支持。

###### 3.3 AD GPO

如果有条件可以测试 AD 域的集成，在专业领域中很有帮助。

完全商业化的软件，既复杂有高效，适用于特定安全需求和大型网络环境与部属，可与 AD 域环境集成。

###### 3.4 Other

```markdown
#　包括不限于

1. Windows 防火墙
2. 事件管理
3. 证书
4. 文件
5. WMI 控件
6. ...

```

##### Attachment

###### Element

MMC、LGPO、Windows Account、Task、Powershell、Batch、Service；

###### Reference

1. [hWindoows 10 使用 MMC 控制 User](https://guo365.github.io/study/Windows10设置标准帐户.html)

论单纯文件保护域 GPO 比较

文件保护等级

1.基于 GPO

可以更高度的自定以权限管理，不但对磁盘、软件、或更多 GPO 可支持的都可以实现，

2.基于文件权限

可限制对磁盘的控制，基于系统的用户和组的权限管理，除此以外其他均不支持。

3.缺陷

虽然是保护大部分的安全，但是用户自身的 Profile 是不受影响到，可以在用户 profile 下保存自己的文件。

因为系统的设计不支持用户自身的文件也无法访问，它是无法否认已创建用户，基本的“人权”还是要有的。

