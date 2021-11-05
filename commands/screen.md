# screen

[screen](https://blog.csdn.net/weixin_40274679/article/details/108520817)

screen 命令允许用户在一个窗口内使用多个终端会话，可以断开连接，也可以重新连接已断开连接的会话。每个会话都可以恢复连接，这样就算会话断开了，用户也不必担心数据丢失

安装 screen
sudo apt install screen

启动一个叫 alvin 的 Screen 会话
screen -S alvin

Ctrl a+d 分离会话

查看已经存在的 screen 进程
screen ls

重新连接到 screen 会话
screen -r screenID
通过名字重新连接到 screen 会话
screen -r alvin

要关闭 Screen 会话, 直接在 screen 会话终端执行 exit 或者 ctrl+d
