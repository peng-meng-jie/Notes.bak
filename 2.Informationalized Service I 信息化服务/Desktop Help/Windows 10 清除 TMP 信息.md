# Windows 10 清除 TMP 信息

注意：

① 不要在不属于你的设备（如工作或学校电脑）上清除 TPM，而无需指示 IT 管理员执行此操作。
② 本地管理员组中的成员身份或同等身份是完成此过程的最低要求。

### 1. 确认信息

#### 1.1 使用 Powershell

使用管理员运行 Powershell，输入：get-tpm，即可获得计算机的 Tpm 信息

**引用**

>  TpmReady上的“false”意味着我的主板上有TPM芯片，但我必须先在BIOS中启用它才能使用它。
> 如果你在TpmPresent上看到“false”，抱歉，你没有主板上的TPM芯片

#### 1.2 使用 tpm.msc

Win+R,输入：tpm.msc 运行此模块 

### 2. 清除TMP

**Powershell**

使用 Administrator 权限 ：Clear-PTM
**Widnows 安全中心**

启动 Windows Defender 安全中心 - 设备安全性 - 处理器安全 - 清除 TPM 信息
**Tpm.msc**

点击右边的“清除TMP信息”的按钮

### 附录

1. [在WINDOWS 10上清除和管理TPM (受信任的平台模块)](https://www.cnblogs.com/feiyucha/p/10888840.html)
2. [更新安全处理器 (TPM) 固件](https://support.microsoft.com/zh-cn/help/4096377/windows-10-update-security-processor-tpm-firmware)
3. [使用 PowerShell 命令管理 TPM](https://docs.microsoft.com/zh-cn/powershell/module/trustedplatformmodule/?view=win10-ps)
4. [TPM](https://trustedcomputinggroup.org/work-groups/trusted-platform-module/)