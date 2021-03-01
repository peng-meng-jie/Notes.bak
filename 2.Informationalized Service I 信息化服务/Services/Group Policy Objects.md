# Group Policy Objects

门槛高、收益少，归档此文档。合理利用 LGPO 即可（搭配 Google 使用）

## 1. GPO

### 1.1 Base

**Windows GPO**

Windows RSAT（远程服务器管理工具）、Windows 10 Pro + 、LGPO、AD GPO；

Install RSAT ： ① 消费者版，control - program - 打开或关闭 Widnows 功能；② 服务器版，在“添加角色或功能向导”中创建服务； ③ 当然也可以离线下载安装，参考附录的 Microsoft Docs；

**基础知识**

需要对 Active Directory® 目录服务或架构、C/C++、C# 一定的知识和理解。



**GPOM 与  AGPM**

> **策略组管理和高级策略组管理** 的区别	-- Blog
>
> 对于软件保障客户，高级组策略管理（AGPM）作为Microsoft桌面优化包（MDOP）的一部分提供。与GPMC不同，AGPM是一个客户端/服务器应用程序，服务器组件在其中离线存储GPO，包括每个GPO的历史记录。由AGPM管理的GPO称为受控GPO，因为它们由AGPM服务管理，并且管理员可以检入和检出它们，就像您可以在GitHub或文档管理系统中检入或检出文件或代码一样。
>
> 与GPMC相比，AGPM对GPO的控制更大。除了提供版本控制外，它还使您可以将诸如Reviewer，Editor和Approver之类的角色分配给组策略管理员，这有助于您在整个GPO生命周期中实施严格的变更控制。AGPM审核还可以更深入地了解组策略更改。
>
> Link [Griup Policy Management](https://blog.netwrix.com/2019/04/18/group-policy-management/)
>
> Notes：AGPM 需要额外订阅产品或企业服务器的订阅（可能需要订阅付费）

**MDOP（高级策略组管理 AGMP）**

作为一款企业级产品，当然是面向企业，订阅费用、门槛高（特殊性、专业化程度极高）

> MDOP 是一套产品, 可帮助简化整个企业的桌面部署、管理和支持。 MDOP 可作为软件保障客户的附加订阅。
>
> **下载 MDOP**MDOP 订阅者可在[Microsoft 批量许可网站 (MVLS)](https://go.microsoft.com/fwlink/p/?LinkId=166331)下载软件。
>
> **购买 MDOP**访问企业版[购买 Windows 企业版许可](https://www.microsoft.com/licensing/how-to-buy/how-to-buy)网站, 了解如何为您的企业购买 MDOP。

## 附录

**Microsoft Docs**

> 1.1 [GPO API](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/policy/group-policy-start-page)
>
> 1.2 [高级组策略管理](https://docs.microsoft.com/zh-cn/microsoft-desktop-optimization-pack/agpm/technical-overview-of-agpm)
>
> 1.3 [适用于 Windows 操作系统的远程服务器管理工具 (RSAT)](https://support.microsoft.com/zh-cn/help/2693643/remote-server-administration-tools-rsat-for-windows-operating-systems)
>
> 1.4 [MDOP Tools](https://docs.microsoft.com/zh-cn/microsoft-desktop-optimization-pack/)

**Web Blog**

> 2.1 [Griup Policy Management](https://blog.netwrix.com/2019/04/18/group-policy-management/)
>
> 2.2 [What is Group Policy, GPO and Why it Matters for Data Security](https://www.varonis.com/blog/group-policy/)

3.[组策略](https://zh.wikipedia.org/wiki/组策略)	-- Wikipedia

4.[Group Policy Search](https://gpsearch.azurewebsites.net/)

5.[Group Policy Best Practices - Netwrix](https://www.netwrix.com/group_policy_best_practices.html)

