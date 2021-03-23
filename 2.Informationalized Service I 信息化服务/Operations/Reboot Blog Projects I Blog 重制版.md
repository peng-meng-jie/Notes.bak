#### Reboot Blog Projects I Blog ”重制版“

概述

分享一些笔记和思路，就是此静态网站的初衷。

日后有需求在更改此网站

注：本人主力的笔记方式为 OneDrive：Markdown + OneNote

[TOC]



#### 1. 需求

主旨：只注重内容产出，无需额外的费用，又能够分享于互联网。

> 不造轮子

熟悉什么技术就用什么技术

> 个人：Windows、PowerShell、Python、以及其他的各方面的基础知识。

需求：

1. 为了能够更好的跨平台，中间件一定要支持虚拟化
2. 主要习惯为 Markdown 文件，输出主力，必须兼容
3. 内容输出为主，而不是重新造轮子，共享于互联网
4. 中间件与客户端分离，数据就是数据，生产就是生产
5. 数据可第三方同步副本
6. 考虑低的成本
7. 与目前所熟悉的技术和平台相融合

所以，架构如下

> 原始文件：Markdown
>
> 静态文件转换器：Python + pelican
>
> 中间件：Git + GitHub Page
>
> 最终成效：GitHub Page



#### 2. 环境

##### 2.1 基础软硬件环境

系统：Windows 10 +  WLS

软件：Windows Terminal、Visual Studio Code、Python、Typora、Git、GitHub

支持虚拟化“中间件'' 

Python

> 虚拟环境

Docker

> 虚拟化，发现更简单的，pass



##### 2.2 我的方案

基于目前的情况，流程分析如下：

1. 原始文件：Markdown

	> Typora、Visual Studio Code、Text or VIM 负责内容产出

2. 静态文件转换器：Python + pelican

	>使用 Python 虚拟环境 + pelican 转换 Markdown 文件为博客的文章，文件为 HTML 

3. 中间件：Git + GitHub Page

	>使用 GitHub Page 服务，本地存储凭证和上传数据，介质可能为：Linux 或 git 或 GitHub Desktop

4. 其他方案

   > 1. 全局 Windows 方案
   >
   >    基础只需 Git 和 Python
   >
   > 2. Docker 方案
   >
   >    基于 Docker 镜像，内建服务；数据可存储在 Docker 中或者 Windows 中
   >
   > 3. Windows + WLS 方案
   >
   >    本地数据负责 WLS 操作，第三方云服务同步，类似于 Docker 方案，数据存储在 Window 中。
   >
   >    选择此方案，主要在于个人数据同步只云端，前后分离，留意虚拟化环境即可

5. 最终成效：GitHub Page

	>使用中间件上传后，通过互联网网络可以访问



最终成果

内容生产：Typora

代码环境：PyCharm Community Edition 2020.2.3、Visual Studio Code、Windows Terminal

内容上载：Github Desktop



#### 3. 部署与维护

##### 3.1 中间件环境与部署

构建中间件

Windows 10 2004 +  WLS 2.0

> git、python

懒

代码环境：PyCharm Community Edition 2020.2.3、Visual Studio Code、Windows Terminal



##### 3.2 维护 与迁移

迁移

基于虚拟化环境，备份 config 文件，一处编译处处可用。



##### 3.3 维护与扩展

扩展

> pelican docs



#### 4. 内容生产

专注内容生产

分享一些笔记和思路，就是此静态网站的初衷



#### Appendix

##### Blog History

1. 毕设

   > 主机：Linux
   >
   > 后端：Python + Django
   >
   > 前端：Bootstrap
   >
   > 数据：SQLite
   >
   > 开发环境：PyCharm

2. 2019.08 GITHUB Page

   > 环境：Git + GitHub Page + Hexo

3. Now GITHUB Page

   > 主机：Windows 10 + WLS
   >
   > 中间件：Python + pelican
   >
   > 服务：GitHub Page
   >
   > 文本输出：Windows Terminal + Visual Studio Code
   
   

##### Reference

1. GitHub

   [how-to-use-pelican.md](https://gist.github.com/JosefJezek/6053301)

   [I can't use pip on WSL Ubuntu - MatheusRV](https://github.com/microsoft/WSL/issues/4020)

2. Blog

   [create-a-blog-with-pelican-and-github-pages](https://rsip22.github.io/blog/create-a-blog-with-pelican-and-github-pages.html)

3. Docs

   https://docs.python.org/zh-cn/3/

   https://www.git-scm.com/doc

