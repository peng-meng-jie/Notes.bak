#### 自定义 Windows 10 Start “磁贴”

对于 Windows 10 预装的软件推荐，通常都用不上，Windows 10 Pro（1607+） 支持自定义。

应用此功能的意义：

① 特殊安全性设置需求；

② 自定义“企业”软件的快捷方式（支持 GPO 部署，但有点复杂）；



1、取消 Windows 10 Start “磁贴” 中的所有“磁贴”；

2、使用 Powershell 导出文件为 xml 文件

```powershell
REM Export-StartLaayout 命令 -Path 指定路径 
Export-StartLaayout —Path "C:\user\Win_Start_NAME.XML"
```

3、Powershell > gpedit.msc > Enter 进入 LGPO（本地注册表）

```markdown
1. 具体路径：用户配置 > 计算机配置 > 管理模板 > “开始”菜单和任务栏；
2. 找到「“开始”屏幕布局」，点击编辑；
3. 手动输入你存放 XML 的路径；
```

4、注销系统的所有用户，然后重新登录后即时生效

补充：也可以重启哦



#### 附录

[使用组策略自定义 Windows 10 “开始”菜单和任务栏	-- Microsfot Docs](https://docs.microsoft.com/zh-cn/windows/configuration/customize-windows-10-start-screens-by-using-group-policy)

[Export-StartLayout	-- Powershell](https://docs.microsoft.com/en-us/powershell/module/startlayout/export-startlayout?view=win10-ps)

