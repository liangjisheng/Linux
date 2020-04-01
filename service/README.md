# README

[study](https://www.jianshu.com/p/b75d88e5aa61)

1.vim /root/svc-test.py
1.vim /etc/systemd/system/svc-test.service
2.chmod u+x /etc/systemd/system/svc-test.service
3.sudo systemctl daemon-reload
4.sudo systemctl start svc-test

启动开机启动
sudo systemctl enable svc-test.service
禁用开机启动
sudo systemctl disable svc-test.service
