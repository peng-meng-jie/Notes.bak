# Windows Program “隔离”

无法判断程序是否存在风险，或程序本身存在风险？但是却无法避免使用它。

合理地使用软件和工具，可以安全的避免该问题。

控制软件来源的途径：Window Store、软件官网、开源程序

## 1.虚拟机

主要软件：VMware Workstation、Oracle VM VirtualBox，需要较好的PC性能

> 备注：推荐使用VirtualBox，开源，无需额外付费

相关安装和配置文章请使用合理地使用搜索引擎

Windows第三方系统发行ISO（不包含系统激活相关），国内请配合相应的下载软件

> 下载地址  [I Tell You](https://msdn.itellyou.cn/)，官方系统提供30天试用，可以合理的”设置时间“以及“快照”功能



## 2.Windows Sandbox

微软自带的Windows Sandbox，需要一定的硬件性能支持。

具体参考：

> [微软官方](https://techcommunity.microsoft.com/t5/windows-kernel-internals/windows-sandbox/ba-p/301849) 
>
> [国内翻译再发布](https://zhuanlan.zhihu.com/p/52751088)



## 3.Windows Guest

Windows 自带的访客账号，权限较低，且不够安全。并不能完全做到”隔离“的效果。

但是性能要求最低，完全复制本机的配置。

微软官方已经把**访客账户设为禁止使用**。

开启账号请使用合理地使用搜索引擎以协助此操作进行。

## 4.Sandbox 软件

大部分需要收费，且价格不菲。

没有专业的需求，无需购买。

