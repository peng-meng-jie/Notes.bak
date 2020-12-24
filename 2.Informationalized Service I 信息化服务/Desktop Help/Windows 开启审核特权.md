# Windows 开启审核特权

Notes：使用系统的功能作为“中间件”，审核系统的变更并记录下来。

## 使用方式

1.开启“本地策略（LGPO）“

> ① open LGPO，Win + R : gpedit.msc	
>
> ② PATH : "计算机 Configuration\Windows Settings\Security Settings\Local Policies\Audit 策略"
>
> notes：这一步是必须的，切记

2.监控程序（Audit）

> ① 选取你需要监管的程序或其他服务，方式为：文件 - 属性 - 安全 - 高级 - Audit
>
> ② 将其设为有限的受控行为
>
> ③ 查看该应用的 Audit ，Win + R : eventvwr.msc，Enter 进入事件查看器

## 附录

1.[审核特权使用](https://docs.microsoft.com/zh-cn/windows/security/threat-protection/auditing/basic-audit-privilege-use)	--Microsoft docs

2.Microsoft Windows Security Inside Out for Windows XP and Windows 2000	-（Books） 19.4 分析系统安全

3.[Windows 服务器审核策略设置](https://www.suajin.com/detail/572)

