Network performance test

从客户端中测试该服务的最大网络速度，测试它的性能是否到达了或符合当前网络需求。

基础准备：下载对应平台的软件版本

软件的可用性

查阅文档，搜寻和收集目标信息，目前可行性如下：

1.可用性测试

```powershell
# client 在 60s 全速度测试，或者更长
iperf <server> -t 60

# service
iperf -s
```

2.并发与压力测试

```powershell
# 在 60s 并发 60 个请求，全速度测试，或者更长
# client 
iperf -c <server> -t 60 -P 60

# service
iperf -s
```

3.Note

还有更多的参数可以调整和设定，可以做更全面的测试，参考官方的技术文档。已符合当前的需求，如果超出该工具的可行性，可以考虑同类型的工具。



Attachment

相关标准

> <u>带宽</u> 是可以传输信息的最大速率，通常以比特/秒为单位
> <u>吞吐量</u> 是信息传输的实际速率
> <u>延迟</u> 是发送处和接收处之间的延迟，这主要是信号传播时间，以及信息经过所有节点需要的处理时间
> <u>抖动</u> 是接收处延迟的变化
> <u>误码率</u> 是将发送位总数除以损坏位数得到的百分比
>
> from Wikipedia

Reference

1. [iperf](https://iperf.fr/)
2. [netperf](https://hewlettpackard.github.io/netperf)
3. [netperf-doc](https://hewlettpackard.github.io/netperf/doc/netperf.html)
4. [iperf-doc](https://iperf.fr/iperf-doc.php)
5. [Network Test（netpref and ipref） 比较 -- Blog](https://wsgzao.github.io/post/netperf/)
6. [Netperf 与网络性能 -- IBM](https://www.ibm.com/developerworks/cn/linux/l-netperf/)
7. [网络性能 -- Wiki](https://zh.wikipedia.org/wiki/网络性能)

