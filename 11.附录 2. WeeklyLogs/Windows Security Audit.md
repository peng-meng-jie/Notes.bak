# Windows Security Audit

出于对系统安全性的考虑，把部分重要的变更记录下来。也可以对此加以限制，可实现的方式如： ① 第三方安全应用供应商；② LGPO or AD+GPO；③ Windows 注册表。

本文简单记录 Windows 系统的安全时间或者日志，不涉及「安全性设定」符合法律法规的设定。

#### 1.1 L-GPO（本地策略组）

最佳的应用方案：Microsoft 高级组策略管理（AGPM），面向企业的 GPO 的专业服务

其次：AD+GPO，域部署方案

**本地策略组**（已记录修改系统时间例）

开启「审核系统事件」（包含时间改动等信息）

```markdown
打开「控制面板 - 管理工具 - 本地安全策略 - 本地策略 - 审核策略 -双击“审核特权使用”- 把成功/失败打勾」确定退出
```

查阅系统安全时间日志

```markdown
「控制面板 - 管理工具 - 系统日志事件」，「事件查看器 - Windows 日志 - 安全」，即可查阅系统时间变更日志
```

#### 1.2 使用注册表 

不必要时，请勿使用此方法

> 通过注册表开启 Windows Time Service Log 记录
>
> [How to turn on debug logging in the Windows Time Service](https://support.microsoft.com/zh-cn/help/816043/how-to-turn-on-debug-logging-in-the-windows-time-service)

#### 1.3  监管程序

> 《Microsoft Windows Security Inside Out for Windows XP and Windows 2000》 第 19.1 节，探索有关安全的策略
>
> 备注：Google Books 上可以看到简体中文版

Notes：已经有了独立的文档描述操作，这里不重复编写

#### 附录

**Link**

1. [基本安全审核策略](https://docs.microsoft.com/zh-cn/windows/security/threat-protection/auditing/basic-security-audit-policies)  -- Microsoft Docs

