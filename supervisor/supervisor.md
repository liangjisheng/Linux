# supervisor

[supervisor](https://blog.csdn.net/zhumin19910702/article/details/127756095)

supervisor 是一个进程管理器，它提供了一个单一的界面来管理和监视许多长时间运行的程序
在 supervisor 下运行的所有程序都必须在非守护模式下运行（有时也称为“前台模式”）

```shell
# install
sudo apt update && sudo apt install supervisor
# 查看 supervisor 启动情况
sudo systemctl status supervisor

# 将 conf 文件写到 /etc/supervisor/conf.d 目录下
# 添加新的程序
sudo supervisorctl update
# 重新读取所有的 conf
sudo supervisorctl reread

sudo supervisorctl status
sudo supervisorctl stop xxx
sudo supervisorctl start xxx
sudo supervisorctl restart xxx
```

```shell
# 进入交互模式
sudo supervisorctl
```
