# Windows 借用 Administrator 权限

此方法不是很安全，只适用于“特定”领域、特殊的要求

Notes:	必须要是 Windows 自带的最高管理员（即 Administrator ）

## 1. 概叙

目的：让普通用户临时借用 Administrator 权限

机制：Powershell	--	中间件（比如：runas）	--	程序运行

用途：比如无需切换用户运行最高权限的 PowerShell、或 cmd

## 2. 方案

**Runas**

微软官方自带的工具，兼容 XP ~ Windows 10

```markdown
1.帮助手册：Win + R: runas ？
2.示例代码
runas.exe /netnoly /user:MyCompany\user "My program path"
3.输入相应的密码即可运行
```

**CPAU**

“进阶版的 Runas ”可加密 bat 命令，更安全的无需手动输入密码

```markdown
1.确认已安装 CPAU：① 加入 System or User Path ② Portable（解压的目录下）
2.打开 PowerShell帮助手册 Runas ？
3.示例代码
CPAU -u MyCompany\userr -p "psw" -ex "My program path" -enc -file D:\run.bat
4.无需其他操作，即可运行
```

**lsrunase**

None	

**Windows 任务**

最为方便，但是只是用于 Administrator 用户组内的用户

## 附录

1.[CPAU](https://www.joeware.net/freetools/tools/cpau/)

2.[Runas	--Microsoft Docs](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc771525(v%3Dws.11))

3.[CPAU 加密仿登入](https://blog.marsen.me/2019/08/20/2019/cpau/)

