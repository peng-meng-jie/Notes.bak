#### Microsoft ProduKey Backup And Restore

当遇到系统收到毁灭性的攻击时，不得不重新安装或重置系统。

事先备份好关键的数据很重要，此处以备份系统的激活码为主题。

###### 1. 备份

```powershell
# 1.查看文件
## 1.1 cmd
wmic path softwarelicensingservice get OA3xOriginalProductKey
## 1.2 powershell
powershell "(Get-WmiObject -query ‘select * from SoftwareLicensingService’).OA3xOriginalProductKey"

# 2.备份证书文件（Powershell 或者手动备份）
$local_keys_1 = C:\Windows\System32\spp\tokens\pkeyconfig\pkeyconfig.xrm-ms
$local_keys_2 = 
C:\Windows\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\tokens.dat
copy-item $local_keys_1 D:/keys
copy-item $local_keys_2 D:/keys

# 3.使用第三方工具
# 使用附录的 Pordukey 软件就可以做到，同时也支持备份其他的 Microsoft 产品。
# 使用方式请看相关文档，基本为简单的 GUI 操作，本文不做描述。
```

###### 2. 还原

注意：证书文件的所有者归系统所有，需要添加权限才能执行还原操作；

2.1 手动恢复

> 1. 控制面板->管理工具->服务->停止“Software Protection”
> 2. 将事先备份的文件复制回它原来所在的位置
> 3. 启动“Software Protection”服务
> 4. 导入原密钥：slmgr.vbs -ipk xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
> 5. 查看激活信息：slmgr -xpr

2.2 半自动化

> 1. Stop-Service -Name "Software Protection"
> 2. Invoke-Item -path ‘C:\Windows\System32\spp\tokens\pkeyconfig\’
> 3. Invoke-Item -path ‘C:\Windows\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\‘
> 4. 把以备份的数据还原到目标文件夹，注意权限。也可以使用 Powershell  辅助操作。
> 5. Start-Service -Name "Software Protectio"
> 6. slmgr.vbs -ipk “激活码”
> 7. slmgr -xpr

###### Reference

1. [Win7手工备份还原密钥和激活文件](https://blog.webish.info/post-31.html)

2. [利用 Poweshell 或 Cmd 查找 Windows 系统激活码](https://zhuanlan.zhihu.com/p/121113305)

3. [ProduKey](http://www.nirsoft.net/utils/product_cd_key_viewer.html)





