# Puppet

首先它是一个运维平台，面向集群主机或服务器的管理器。核心就是运行此架构对集群的资源化管理，人在其中发挥着“中间件”管理员的作用，让它更好的为人类服务。以下文章以简单的介架构、流程和一个运行示例为题。

> Puppet 是一个开源系统配置管理工具，它有着简明的架构以及良好的扩展性；同时，Puppet 还提供了自有的系统配置描述语言以及完善的公用库，非常适合用于管理和部署大规模集群系统。

### 基础

认识一项新的“服务、功能或新的技术”就从它的通用基本“架构”开始，其次就是它的流程，最后依据文档和自己的知识结合搭建所需的业务或需求。

#### 架构

其设计是 CS 架构，分为 Server and Client（单个服务器对应多个客户端，即 Server and Node Exchange）。和其他服务架构相似（比如 NTP、AD+GPO、TCP/IP），服务器上启用“模板”或策略，同步到 客户端，客户端反馈执行报告。

#### Work Flow

简单的概括：Define  -- Simulate  -- Enforce  -- Report

> **定义（Define）**
>
> 管理员为各个节点编写配置文件，配置文件中定义了该节点所需要的资源的集合以及资源之间的关系。这些资源可以是文件、服务、软件包、可执行的命令等等。Puppet 内置的配置管理语言对这些资源提供了较为完整的底层抽象，减轻了编写配置文件的复杂度。
>
> **模拟（Simulate）**
>
> 根据节点的配置文件，我们可以了解到该节点需要什么样的资源并且处于什么样的状态。配置文件描述了节点的状态，而不是具体的配置步骤。Puppet 会将配置文件 Manifest 编译成更为详细的一种配置文件 Catalog。通过 Catalog，Puppet 会根据节点的当前状态，模拟出节点达到该目标状态所需要的步骤。
>
> **应用（Enforce）**
>
> 节点周期性地向 Puppet Server 来请求自己最新的配置文件。Puppet 会将节点的实际状态与节点配置文件中所表述的目标状态做比较，并根据得到的所需要的步骤，对节点执行操作，使其达到配置文件所表述的状态。
>
> **报告（Report）**
>
> 当每次应用执行过后，节点都会给 Puppet Server 发送一份运行报告，报告该节点的状态，以便以后的分析和统计。

### 示例

懒的额外阐述，不要太多的文字沉余，合理使用 Internet 现成的用户手册或文档。

> 服务器
>
> [Puppet Server for lnux 的部署与应用](https://juejin.im/entry/5d2db5eef265da1b7c614c2c)
>
> 有关客户端
>
> [Puppet Clinet for Windows、Linxu、macOS](https://puppet.com/docs/puppetserver/5.3/install_from_packages.html)

**Notes**：

Linux 版本涉及到 DNS、Config（Linux Program）、Base、Base Script（Python Script）、Puppet config 配置结构、Man 手册。其中要注意的是 Linux 基础和 Puppet config 的 API 和“文件引用结构”。

跟多信息请浏览 Puppet 官方的文档，有你想要的“轮子”。

### 附录

#### Link

1. [Puppet Docs](https://puppet.com/docs/)
2. [Puppet  -- Wikipedia](https://en.wikipedia.org/wiki/Puppet_(company))
3. [利用 Puppet 实现自动化管理配置 Linux 计算机集群](https://www.ibm.com/developerworks/cn/opensource/os-cn-puppet/index.html)
4. [Puppet 的部署与应用](https://juejin.im/entry/5d2db5eef265da1b7c614c2c)