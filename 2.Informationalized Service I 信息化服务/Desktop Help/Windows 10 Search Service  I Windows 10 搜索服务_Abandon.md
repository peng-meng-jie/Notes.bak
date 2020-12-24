#### Windows 10 Search Service  I Windows 10 搜索服务



使用 Windows Search 服务找到你的文件

> 够用就好，暂停编辑 2020.12.11



##### 1. Windows 10 Desktop Search

基础，若无固态硬盘，请深思后再决定使用

**启动和使用**

1.标准

> Win + S 或 Win + 任意按键

2.文件类型

> <Type> <name>
>
> 比如：pdf 计划书



**Windows 索引**

文件历史记录

> Win +Tab

增加文件记录

> Windows Setting > Search > Search Windows > Advanced Search Index Setting



##### 2. Windows 10 File Explorer Search

支持的内容

> 文件名称和文件标签

正则表达式

> 比如 * 模糊查询、 ~ 区间



##### 3. PowerShell 5.0 Search

注意：PowerShell 支持文件搜索，但不建议普通用户使用。

```powershell
# 检索当下文件夹下的 PDF 文件
Get-ChildItem -Force -Recurse | Where-Object {$_.Name -like "*.pdf"
```



##### Appendix

Reference

https://sspai.com/post/55906

