# certbot

[certbot](https://blog.csdn.net/qq_36840228/article/details/121038844)

## linxu install

[install](https://certbot.eff.org/instructions?ws=nginx&os=ubuntubionic)

```shell
sudo apt-get update
sudo apt install snapd
# 执行下面命令确保使用最新版本的 snapd
sudo snap install core; sudo snap refresh core
# 移除之前的 certbot
sudo apt-get remove certbot

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

## mac install

```shell
brew install certbot
```

## get certificate

[article](https://www.jianshu.com/p/f96dd651af7e)

```shell
sudo certbot certonly  -d *.web3.com --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
```
