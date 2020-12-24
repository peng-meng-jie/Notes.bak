# Package Manage

> 软件包管理系统是在电脑中自动安装、配制、卸载和升级软件包的工具组合，在各种系统软件和应用软件的安装管理中均有广泛应用。	--Wiki

## 1. Linux

目前的分为二个流派 RPM（ Contos ） 、DPKG（Debian），各自有不同的特色。只需要站在以为使用者的角度去使用就好了，基于各自 Linux 发行版使用相应的前端（yum or apt）即可。

> [Linux 平台上的软件包管理](https://www.ibm.com/developerworks/cn/linux/l-cn-rpmdpkg/index.html)	-IBM

**软件包管理的前端使用**

> **YUM 常用命令**
> 安装指定软件 :
> $ yum -y install package-name
> 列出系统中已安装软件
> $ yum list
> 列出系统中可升级的所有软件
> $ yum check-update
> 升级系统中可升级的所有软件
> $ yum update
> 升级指定软件
> $ yum update package-name
> 在升级过程中接受所有互动问答
> $ yum -y update
> 卸载指定软件
> $ yum remove package-name
>
> **APT 常用命令**
> 更新源索引
> $ sudo apt-get update
> 安装指定软件
> $ sudo apt-get install package-name
> 下载指定软件的源文件
> $ sudo apt-get source package-name
> 将系统中所有软件升级到最新版本
> $ sudo apt-get upgrade
> 将操作系统连同所有软件升级到最新版本
> $ sudo apt-get dist-upgrade
> 卸载指定软件
> $ sudo apt-get remove package-name
>
> [Linux 平台上的软件包管理](https://www.ibm.com/developerworks/cn/linux/l-cn-rpmdpkg/index.html)	--IBM # Yum 和 Apt 的常见使用命令

**二进制 / 源码的手动编译**

Null

**Notes**

它们各自的封装就不做深入了解。我猜测也就是基于“数据文件的封装”而已，比如压缩 7zip，基于自己的压缩结构、数据编码、算法模型等等。其次我可能需要了解 Linux 二进制编译，而不是开发软件。

## 2. Windows

Windows 目前没有标准化的软件管理中间件

**原因**

1.供应平台没有达到商业化“管理”的程度。官方有相应的 Windows Store，但是却没有嵌套“管理”中间件。有第三方的软件平台，但并不集成在 Windows System 内，非 Microsoft 程序，各方面受限制（比如部署）。

2.开发商们的利益矛盾。各家企业开发各家的 Program ，企业利益和理念之间的 Program 存在冲突，难以统一，不方便管理。

**手动管理**

极其消耗人力资源极其不方便，其设计的初衷是个人桌面级的设计，完全完全没有管控的思路可以看到。

Windows 7，管理员权限+Control（Program Manage）+软件供应商

Windows 10，管理员权限+Control（Program Manage）+软件供应商。注意：Windows 10 如果可以请卸载 Windows Store（不能与外网共存）。

**AD 域 GPO**

可以实现定期推送，自动部署。补充缺点： 兼容性差，比如软件包限制（MIS），需要第三方工具转换 EXE。自动部署，需要额外的工具协助（Windows 排程 + BAT 批命令程序 + Windows Program ）。

> [ 组策略分发软件全攻略](https://blog.51cto.com/ityatou/90202)	--Blog

**包管理器**

Chocolatey 有门槛，不适合普通用户，面向命令方式。大部分为社区运营，商业化的管理不成熟。

> [chocolatey](https://chocolatey.org)
>
> [chocolatey package list](https://chocolatey.org/packages)

**Other**

Null

**Notes**

商业化，我觉得还是 AD 域 + Desktop 手动管理即可，麻烦自己，服务大众；

个人使用的是，Administrator ＋User and Program Manage and Windows Store and 第三方 Software 供应平台

## 附录

1.[软件包管理系统](https://zh.wikipedia.org/wiki/软件包管理系统)	--Wiki

2.[chocolatey](https://chocolatey.org)

3.[Linux 平台上的软件包管理](https://www.ibm.com/developerworks/cn/linux/l-cn-rpmdpkg/index.html)	-IBM

