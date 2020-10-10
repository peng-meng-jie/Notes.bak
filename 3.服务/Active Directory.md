# Active Directory

Note：知识结构引自 Wikipedia ；

[TOC]

## 1. Microsoft Active Directory

请查阅 Wiki 的百科，对此进行了解和再次扩展；

### 1.1 结构

#### 1.1.1 目录结构

**树、对象、集成**

树，为域的基本单位，可作为根或分支的域控制。

域的对象有五个基本单位，查看引用

> - Domain Controllers，存储网域所属的网域控制站（简称DC、域控）。
> - Computers，存储加入网域的电脑对象。
> - Builtin，存储内置的账户组群。
> - Users，存储AD中的用户对象。
> - 组织单元（Organization Unit，简称 OU）
>
> -- Wikipedia

集成：树系和多网域（简单来说”树“多了就组成了"森林”）

#### 1.1.2 实体结构

> [AD 的实体结构](https://zh.wikipedia.org/wiki/Active_Directory#實體結構)	-- Wikipedia

Notes：以“实体”为基础，利用自己设计的”数据结构“和网络协议，构成整个运行的实体（基于硬件或服务）的健全系统。比如存储 AD的 数据、变更服务（代表容灾迁移）、数据传输链路（DNS）、安全权限防护；

### 1.2 安全

> 活动目录的安全性可分为对象的安全性识别、层次结构的安全性以及森林之间的信任关系等。
>
> AD　以[Kerberos](https://zh.wikipedia.org/wiki/Kerberos) V5 作为其安全验证的主要架构

Note: 在层次结构和域域之间的信任关系，设计安全性；

### 1.3 名称系统

每个 AD 对象都有一个 LDAP 组成，其设计是为了方便人对“系统”的可阅读信息（二进制是“机器语言”，非人类可直接观察），拥有其自定义的架构名称、关系连词、唯一 ID、其他可扩展性；

### 1.4 功能与对象

**功能层次**

> - `adprep /forestprep`：升级树系的数据结构。
> - `adprep /domainprep`：升级网域的数据结构。
> - `adprep /rodcprep`：准备网域以提供RODC（只读网域控制站）的功能（Windows Server 2008以后版本才支持）。

**结构**

Pass...

### 1.5 集成服务

集成服务：复杂型、轻量级、证书服务、权限服务；

跨平台：Samba（Windows and Linux）；

#### 1.5.1 联合服务

微软也开始利用AD来设计一个可支持多个网站（或应用程序）的单一签入功能，起名为活动目录 Federation Services（AD联合服务，简称ADFS）,一下为成员：

> - Federation Service：负责在ADFS的SSO架构中处理验证的服务器。
> - Federation Service Proxy：在外部网络或是WS-I服务中，扮演Federation Service的代理角色，并支持WS-Federation规格的验证设置。
> - Claim-aware client：由ADFS开放的Claim-aware（宣告感知）组件的Web客户端，或是[ASP.NET](https://zh.wikipedia.org/wiki/ASP.NET)应用程序，可直接支持ADFS的SSO架构。
> - Windows Token-based Agent：以Windows验证为主的Web应用程序，ADFS可支持AD权仗与Windows NT权仗的模拟与交换。

#### 1.5.2 轻量级服务

> 轻量级服务（Lightweight Directory Service）[[6\]](https://zh.wikipedia.org/wiki/Active_Directory#cite_note-6)在Windows Server 2003中被称为活动目录 Application Mode（ADAM），它是一个不需要与AD基础架构集成就可以独立运作的目录服务，适合用来表现企业的层次结构化概念与对象的管理，而且开发人员只要把使用ADSI的经验搬过来即可使用，不必另外学习ADAM的操作方法，它也可以做为ADFS的外部验证提供者。轻量级目录可以在同一台电脑中安装多个运行个体，因此也很适合用ADAM来实现Directory-Enabled的应用程序，尤其是与组织结构相关的（例如人事或人力资源系统），ADAM本身也可以延伸schema，开发人员可以将ADAM视为另一种型式的数据库，也可以由AD中复制数据到ADAM，不过ADAM不会对AD进行站台复制，开发人员需要自行撰写程序来复制数据。
>
> 轻量级服务在Windows Server 2008中改名为活动目录 Lightweight Directory Service（简称AD LDS），并提升为AD的应用角色之一。

#### 1.5.3 补充

证书

> 证书服务（Certificate Service）[[7\]](https://zh.wikipedia.org/wiki/Active_Directory#cite_note-7)是在Windows Server 2008中首次纳入活动目录体系的服务，它原本是在Windows 2000与Windows Server 2003的证书服务器（Certificate Server），用来创建企业中的[公开密钥基础建设](https://zh.wikipedia.org/wiki/公開金鑰基礎建設)，在Windows Server 2008中，证书和AD对象有了更强更紧密的集成，所以有了活动目录 Certificate Service（AD CS）的角色，这个角色还可以和权限管理的Right Management Service（RMS）集成在一起，提供对文件或应用程序层次的权利管理。

管理服务

> 权利管理服务（Right Management Service）[[8\]](https://zh.wikipedia.org/wiki/Active_Directory#cite_note-8)也是在Windows Server 2008中首次纳入活动目录体系的服务，最早的时候，它是在[Microsoft Office 2003](https://zh.wikipedia.org/wiki/Microsoft_Office)开始提出的信息权利管理（Information Right Management）功能，可利用它来控制Office文件散布时的权限，例如打印以及存储文件等，接着微软发表了Right Management Server以及RMS SDK，供Windows Server 2003平台使用，而在Windows Server 2008中即将它集成到活动目录中，变成AD服务的一部分。



## Appendix

### 1. Reference

1. [AD](https://zh.wikipedia.org/wiki/Active_Directory)  -- Wiki

2. Microsoft Docs

   [Azure AD（译文）](http://docs.azure.cn/)  -- 国区代理

   [Windows Server Docs](https://docs.microsoft.com/zh-cn/windows-server/)

3. [Windows Server 2008，基于 LDAP 的 AD 域服务器搭建及其使用 ](https://www.cnblogs.com/cnjavahome/p/9029665.html)

4. [LDAP -- Gitbook](https://daiker.gitbook.io/windows-protocol/ldap-pian/8)

5. [Group Policy Administrative Templates Catalog](https://getadmx.com/)

