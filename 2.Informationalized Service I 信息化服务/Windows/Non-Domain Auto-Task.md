#### Non-Domain Auto-Task

由于各种原因无法适用 AD GPO、或者本身就没有域 GPG 环境，对每一个单独的用户进行配置和管理是一项不断重复的工作也损耗很多不必要时间和精力，单机版或本地计算机维护和管理的自动化是必要的，毕竟计算机本身就是为人类服务，而不是让人在不断地重复劳动。

注意：本文适用于 IT 管理员

补充：本文内容同样适用于 AD 域集成，已到达更有效的计算机资源管理。



##### 1. 问题概述

问题：增加注册表以修复 office 产品的缺陷；

方式：手动、自动，手动执行可以确保有 100% 的成功率，自动化则有可能因其他的不可控因素影响。

基础环境：AD 域集成、公共脱域主机、跨系统版本 Win 7+10。

条件包含但不限于此：管理员权限、Windows 10 Pro、Non-Domian ...

Note：个人认为基于 AD 域的 GPO 派送是最为有效的管理方式，但却不是本文的初衷，做法和考虑不做阐述；

##### 2. 方案

手动操作

通过公告或转述等信息交流信息推广，由最终的使用者执行和操作；只需要处理好信息和资源转交即可，相关方式：包括不限于用户操作手册、资源共享、网络公告、口头转述等。

自动化（AD 域集成）

由管理员统一分配和下发代码，对于部分特殊的主机执行手动操作。统一管理计算机资源，基于现有的集成环境，如 GPO 与注册表、登录脚本、Task 等形式。



##### 3. 基于 Microsoft 所支持的方案

###### Task

> [Task Scheduler for developers](https://docs.microsoft.com/zh-cn/windows/win32/taskschd/task-scheduler-start-page)
>
> Note：创建一个登录监控的中间件，每次登录就触发该条件，已到达预期的结果。

###### Startup

> 系统自启：Win+R shell:common startup
>
> 用户自启：Win+R shell:startup
>
> [Add an app to run automatically at startup in Windows 10](https://support.microsoft.com/en-us/help/4558286/windows-10-add-an-app-to-run-automatically-at-startup)
>
> Note：设定后在系统启动时或登录时即运行相关的代码，已到达预期的结果。

###### LGPO

> [Working with startup, shutdown, logon, and logoff scripts using the Local Group Policy Editor](https://docs.microsoft.com/zh-cn/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn789190(v=ws.11))
>
> Note：适用于本地计算机 Windows 7 Pro +，可编辑和添加用户登录脚本，相对比 Task、Startup 的启动方式更为友好，兼容性和成功也更高。

###### Public-User-Profile

> [How to make a desktop shortcut available for all users in Windows 10](https://superuser.com/questions/984866/how-to-make-a-desktop-shortcut-available-for-all-users-in-windows-10)
>
> Note：把文件存放在公共用户文件夹中，普通用户无法删除，有使用者按需操作。

###### Note

以上的方法操作部分已忽略，仅提供思维上和现有可使用的形式作为参考。



##### Appendix

###### Fix-Outlook-Not-Login-Code

1. Windows Batch Command

```powershell
reg add \HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\AutoDiscover /v excludehttpsrootdomain /t REG_DWORD /d 00000001 /F
```

2. Windows REG edit

```powershell
[HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\AutoDiscover]
"excludehttpsrootdomain"=dword:00000001
```

3. PowerShell 

   > [Update or Add Registry Key Value with PowerShell](https://devblogs.microsoft.com/scripting/update-or-add-registry-key-value-with-powershell/)
   >
   > Note: : 参考该文章和需要修改的注册表即可；

###### Reference

1. Microsoft 

   [Add an app to run automatically at startup in Windows 10](https://support.microsoft.com/en-us/help/4558286/windows-10-add-an-app-to-run-automatically-at-startup)
   [Task Scheduler for developers](https://docs.microsoft.com/zh-cn/windows/win32/taskschd/task-scheduler-start-page)

   [Working with startup, shutdown, logon, and logoff scripts using the Local Group Policy Editor](https://docs.microsoft.com/zh-cn/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn789190(v=ws.11))

2. [How to make a desktop shortcut available for all users in Windows 10](https://superuser.com/questions/984866/how-to-make-a-desktop-shortcut-available-for-all-users-in-windows-10)

3. [Update or Add Registry Key Value with PowerShell](https://devblogs.microsoft.com/scripting/update-or-add-registry-key-value-with-powershell/)





