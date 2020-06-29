# 打开 Windows 时间服务的调试日志记录

调试无法在 Windows View log 追踪到的时间异常改动的信息. 

Note: 具备可重现的环境, 且是与服务器同步时后的时间信息，不具备前面的条件就是漫长且不确定的等待

### 1. 基础准备

改动注册表可会导致系统损坏, 改动前的备份是必须的, 方便快速"回滚"到健康的状态;

**备份与还原**

1. 对 regedit 进行备份还原

2. 对系统进行备份与还原

   ① 创建系统还原点;

   ② 使用虚拟机快照;

> 参考链接:  [How to back up and restore the registry in Windows](https://support.microsoft.com/en-us/help/322756/how-to-back-up-and-restore-the-registry-in-windows)

### 2. 开启 W32Time Server 调试日志

用于调试与"服务器"同步的日志信息, 协助排查功能. 操作方式可为: 手动/自动

**2.1 使用 Regedit GUI 添加**

1. Win + R ：regedit，Enter 打开

2. 进入路径：HKEY_LOCAL_MACHINE \ SYSTEM \ CurrentControlSet \ Services \ W32Time \ Config

3. 手动添加"注册表值"

   > 1. **Value Name: FileLogSize**
   >    Data Type: DWORD
   >    Value data: 10000000
   >
   > This registry value specifies the size of the log file in bytes.
   > A value of 10000000 bytes will limit the log file to approximately 10 MB.
   >
   > 2. **Value name: FileLogName**
   >    Data Type: String
   >    Value data: C:\Windows\Temp\w32time.log
   >
   > This registry value specifies the location of the log file. The path is not fixed. You can use a different path.
   >
   > 3. **Value name: FileLogEntries**
   >    Data Type: String
   >    Value: 0-116
   >
   > This registry value specifies the level of detail of the information in the debug log. If you must have more detailed logging information, contact a Microsoft Support Professional.
   >
   > Note The Data Type value must be of type REG_SZ (String). You must type the value exactly as shown (that is, type 0-116). The highest possible value is 0-300 for most detailed logging. The meaning of this value is: Log all entries within the range of 0 and 116.

**2.2 使用脚本注入**

1. 使用 Visual Studio Code 创建一个 名为 (比如 OnTimeLogs) .reg 的文件

2. 在文本中键入以下信息

   ```markdown
   Windows Registry Editor Version 5.00
   
   [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Config]
   "FileLogSize"=dword:10000000
   "FileLogName"="C:\\Windows\\Temp\\s32time.log"
   "FileLogEntries"="0-116"\
   ```

3. 保存，使用管理员权限运行脚本

### 附录

**Link**

1. [How to turn on debug logging in the Windows Time Service](https://support.microsoft.com/zh-cn/help/816043/how-to-turn-on-debug-logging-in-the-windows-time-service)
2. [How to back up and restore the registry in Windows](https://support.microsoft.com/en-us/help/322756/how-to-back-up-and-restore-the-registry-in-windows)
3. [如何使用 .reg 文件添加、修改或删除注册表子项和值](https://support.microsoft.com/zh-cn/help/310516/how-to-add-modify-or-delete-registry-subkeys-and-values-by-using-a-reg)
4. [使用REG注册表文件添加、修改或删除注册表键值和子项介绍](https://www.jb51.net/os/77905.html)

