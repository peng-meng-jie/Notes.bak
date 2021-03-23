# User-Manage.sh
read -p "This is not an sh, it's a Note ，Continue? (Y/N): " | exit 1

# 1.Manage-User
# View-manucs-to-build（man）
<<!
man -k 'user'
su (1)               - run a command with substitute user and group ID 
useradd (8)          - create a new user or update default new user information
userdel (8)          - delete a user account and related files
usermod (8)          - modify a user account
...
man -k password
passwd (1)           - change user password
...
!
# 2.Manage-Group
$usermod -G groupNmame username # Add User to Group
$usermod -g groupName username # changer group （del old group
$more /etc/passwd # or /etc/group ，View User And Group Information

# 3.User-Permission
# 分为“字母模式”+“数字模式”，进行授权
# $chmod userMark(+|-)PermissionsMark # 格式
# UserMark 值：u 用户 - g 组 - o 其他用户 - a 所有用户
# Permissionsmark 值：r 读 - w 写 - x 执行
# 使用三位八进制数字的形式来表示权限，第一位指定属主的权限，第二位指定组权限，第三位指定其他用户的权限，每位通过4(读)、2(写)、1(执行)三种数值的和来确定权限。如6(4+2)代表有读写权，7(4+2+1)有读、写和执行的权限。
$chown username dirOrFile # Change-Files-Owner | 变更文件拥有者
$chown -R weber server/ # 附加递归方式进行权限变更

# 4.Environment-Config
# /etc/profile，/etc/bashrc 是系统全局环境变量设定
# ~/.profile，~/.bashrc用户目录下的私有环境变量设定

# Note
# useradd passwd userdel usermod chmod chown .bashrc .bash_profile
<<!
顾名思义 ： useradd passwd usermod
Linux 权限（ACL） ：权限分类，读-写-执行
权限管理 ：chmod chown 
个性化指令（Alias）：全局变量、用户变量
!

