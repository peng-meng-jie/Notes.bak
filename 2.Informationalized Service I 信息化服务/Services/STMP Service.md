# STMP Service

基于 TCP/IP 的协议，测试是使用 Telnet 和 STMP 命令

相关协议：MXDNS、POP3、IMAP、UUCP等其他协议

## 1. 构建 STMP 服务

**Windows Server**

[BizTalk Server 附录 D：创建 SMTP 服务器	--Microsoft docs](https://docs.microsoft.com/zh-cn/biztalk/install-and-config-guides/appendix-d-create-the-smtp-server)

**Liunx**

同样的原理, 基于服务 ( 比如 postfix ), 编写配置 config, Telnet 测试

[Postfix Docs](http://www.postfix.org/documentation.html)

## 2. 测试

基于 Telnet 进行测试，Windows 的 Power Shell

1.远程方式:	Tetnet //IP Address// //Port//，如：telnet 192.168.33.255 25

2.示例代码

```markdown	
1.DATA
2.MAIL FROM: <NAME@T.COM>
3.RCPT TO: <TO_NAME@T.COM>
	SUBJECT: TSET
	THIS IS A TEST MASSAGE
	.
4.QUIT
```



[Telnet 测试 STMP 服务](https://docs.microsoft.com/zh-cn/exchange/mail-flow/test-smtp-with-telnet?view=exchserver-2019)

## #附录

1.[Telnet 测试 STMP 服务](https://docs.microsoft.com/zh-cn/exchange/mail-flow/test-smtp-with-telnet?view=exchserver-2019)

2.[BizTalk Server 附录 D：创建 SMTP 服务器	--Microsoft docs](https://docs.microsoft.com/zh-cn/biztalk/install-and-config-guides/appendix-d-create-the-smtp-server)

