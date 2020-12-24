##### Microsoft BitLocker

**简单概论**

> BitLocker 驱动器加密是一项数据保护功能，它与操作系统集成，用于解决来自丢失、被盗或销毁不当的计算机的数据被盗或泄露的威胁

支持脱机保护，但最好不要把密码只存储在 Windows 主机上，对于会使用的人群等于无加密；

简单的流程概述：安全需求-硬件支持-方案评估-部署-后期维护；

**必须满足以下要求**

硬件要求：TPM 1.2+ 芯片、U 盘、硬盘；

软件要求：Windows 7 Pro + and BitLocker

###### 1. BitLocker 加密

1.1 应用于工作站、个人、家用

>**打开设备加密**
>
>   - 使用管理员帐户登录 Windows（可能必须注销并重新登录才能切换帐户）。有关详细信息，请参阅[在 Windows 10 中创建本地用户或管理员帐户](https://support.microsoft.com/help/4026923)。
>   - 选择“开始”按钮 ，然后依次选择“设置” >“更新和安全”>“设备加密”。如果“设备加密”未显示，则此选项不可用。你或许可以改用标准 BitLocker 加密。
>   - 如果设备加密处于关闭状态，请选择“打开”。
>
>**打开标准 BitLocker 加密**
>
>   - 使用管理员帐户登录 Windows 设备（可能必须注销并重新登录才能切换帐户）。有关详细信息，请参阅[在 Windows 10 中创建本地用户或管理员帐户](https://support.microsoft.com/help/4026923)。
>   - 在任务栏上的搜索框中，键入“管理 BitLocker”，然后从结果列表中选择它。或者，你可以选择“开始”按钮 ，然后在“Windows 系统”下选择“控制面板”。在“控制面板”中选择“系统和安全”，然后在“BitLocker 驱动器加密”下选择“管理 BitLocker”。**注意：**仅当设备配备 BitLocker 时才会显示此选项。它无法用于 Windows 10 家庭版。
>   - 选择“打开 BitLocker”，然后按照说明进行操作。

补充，BitLocker 支持 Server 部署和管理，请参阅

> [信息安全 > BitLocker --Microsoft Docs](https://docs.microsoft.com/zh-cn/windows/security/information-protection/bitlocker/bitlocker-overview)

###### 2. BitLocker 解密

> [BitLocker 解密](https://docs.microsoft.com/zh-cn/windows/security/information-protection/bitlocker/bitlocker-recovery-guide-plan)

###### Attachment 

Microsoft Docs

1. [信息保护](https://docs.microsoft.com/zh-cn/windows/security/information-protection/)
2. [开启 Bitlocker 加密](https://support.microsoft.com/zh-cn/help/4028713/windows-10-turn-on-device-encryption)
3. [BitLocker 解密](https://docs.microsoft.com/zh-cn/windows/security/information-protection/bitlocker/bitlocker-recovery-guide-plan)

Link

1. [BitLocker 应用解析（使用 Windows 7） --Lenovo Support](http://kms.lenovots.com/kb/article.php?id=12359)

   