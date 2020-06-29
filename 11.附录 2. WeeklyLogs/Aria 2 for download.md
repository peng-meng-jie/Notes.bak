# Aria 2 for download

开源、多协议、多线程、不用付费、没有广告，且存在一定的上手难度

## 1. Aria2 环境

Aria2 是已编译二进制程序，可使用在：各大平台的命令台中运行

- Power shell、Bash 的基本的操作；
- conf 手动配置
- TCP、IP 协议
- Windows、Linux 相应的 “软链接和硬链接”

## 2. 简单的示例

```markdown
1.访问 Aria2 Github 的下载页面，下载相应平台的“二进制”软件包
2.解压至一个方便的文件存放地址（比如软件的安装目录）
3.添加和编辑 conf 文件
	> 如何编辑 Aria2 conf，请参考#附录的链接[3]
4.打开 PowerShell 键入以下命令
	.\aria2c.exe --conf-path=.\[conf name].conf
5.打开#附录链接[2]的 Web Controler
6.新建一个下载任务，粘贴需要下载的链接
```

## 3. Web Controler

1.云端 Web Controler 请参考#附录链接[2]

2.本地 Web Controler 暂无推荐，请使用 Google、Github

## #Notes

自定义 Aria 2 查阅#附录链接中的官方手册和技术文档

## #附录

Link List

1.[Aria 2	--Github](https://github.com/aria2/aria2)

2.[Aria2 Web Controler](http://aria2c.com/)

3.[Aria2 Manual	--官方手册](https://aria2.github.io/manual/en/html/index.html)

> [Aria2 conf 说明	--译文](http://aria2c.com/usage.html)

4.[解决Aria2 BT下载速度慢没速度的问题](http://www.senra.me/solutions-to-aria2-bt-metalink-download-slowly/)

5.[Aria2 --少数派](https://sspai.com/post/55334)

