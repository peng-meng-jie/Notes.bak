### Network Attached Storage (NAS)

引述

> **网络附加存储**（英语：**N**etwork **A**ttached **S**torage，缩写：**NAS**）[[1\]](https://zh.wikipedia.org/wiki/網路附加儲存#cite_note-1)，是一种专门的[数据存储](https://zh.wikipedia.org/w/index.php?title=資料儲存&action=edit&redlink=1)技术的名称，它可以直接连接在[电脑网络](https://zh.wikipedia.org/wiki/电脑网络)上面，对[异质网络](https://zh.wikipedia.org/wiki/異質網路)用户提供了集中式数据访问服务。

此文记录硬件到系统到软件, 再到同步服务/家庭影音/文件备份/异常容灾. 但这些知识是一些思维的记录和笔记,不具备通用性。最初记录此笔记是因为使用虚拟器虚拟了一个“黑群晖”，但效果并不是很好。以此来完成我 NAS 最初的探索。以下列举它所具备的优势：

 容灾、大容量、同步共享、7*24，这些都是传统的计算机布不具备的特点或不擅长的领域；

注意：此文章主要讨论自主创建或组件 NAS 而编写,所以不会侧重于商业化的集成服务商方案．

#### 组件

简单说明，市面上的 NAS 系统yi均是基于 Linux 开发而来；它是一个文件存储、同步的解决方案的集成。主要是需求的情况基于你的需求就可以很快的找到解决的方案。如果是探索功能的便利则不属于此文章的主旨，这并不是为了折腾而写的。

###### 硬件

和传统的计算机组成 原理基本一直，但是不同的地方是：硬盘、供电、噪音；

这就涉及到主机机箱、电源、内存、主板、CPU、存储等因素，基于这些组成部分与需求相结合，那就是理想中的 NAS 主机或服务器。因为差异的存在，考虑的硬件因素需要和当下的硬件供应商和现在的 NAS 行业发展情况，这更能够打造一台时下合适的主机。

主要考虑因素：硬盘与主机机箱（容量需求）；

###### 系统

选择一个系统可以事半功倍，对于目前主流 NAS 系统开发情况，可以参阅第三方文章。不必要花费太多的时间在选择系统方面上，因为系统是为了支撑需求的基本因素，借助信息和需求的结合可能更多的时间。如果拥有了“钞”能力，这些均不是问题，NAS 行业中已经拥有了一批稳定且强大的服务供应商。

还有另一主题是：“黑”群晖，此文不做补充，由于其自身不具备稳定，需要随时互联网中解决方案。对于稳定性和商业性来说，它们不太贴近实际。

> [常见的 NAS 系统整理 -- blog ](http://einverne.github.io/post/2020/02/nas-operating-system-choice.html) (不包含群晖/威联通)

###### 其他

如何构建一个 NAS ？请准备 ￥

1. 硬件：主机、磁盘、扩展卡、网络布局；
2. 软件：系统、同步共享、备份；
3. 使用手册；
4. 或者你有更多的 ￥ ，可以优秀的集成商的方案

Notes: Pending status

###### 用户手册

参阅各个系统的官方网站的文档，如果没有可以参阅 Google；

至于底层的技术和服务目前暂不考虑，作为一名消费者，我需要考虑的只解决方案；

#### Attachment 1 # Windows NAS ！

只列举软件所提供的服务，可以被代替。

> 文件传输：FTP、文件共享、可道云、FileRun、Zdir；
>
> Download：PanDown、transmission、qBit、Aria2、迅雷；
>
> 媒体：Emby、荔枝相册；
>
> 备份：傲梅、7zip；
>
> 远程：TeamViews、向日葵、VPS（FRP）、Microsoft RemoveDesktop、Anydesk；
>
> 文件管理：Everything、Rename、Fastcopy；

#### Attachment 2 # Link

1. [What is NAS？ -- Huiwei](https://support.huawei.com/enterprise/zh/doc/EDOC1100096896)
2.  [常见的 NAS 系统整理 -- blog ](http://einverne.github.io/post/2020/02/nas-operating-system-choice.html) (不包含群晖/威联通)
3. [網路附加儲存 -- Wikipedia](https://zh.wikipedia.org/wiki/網路附加儲存)
4. [FreeNAS](www.freenas.org)
5. [Windows NAS](https://post.smzdm.com/p/ammkggrz/)（使用软件启用服务，手动集成）

