# openssl

[X.509](http://www.flydean.com/42-pki-x509/)

```shell
# 使用RSA算法，生成密钥对
openssl genrsa -des3 -out ca.key 1024
# 用这个ca.key来创建证书
openssl req -new -x509 -days 20 -key ca.key -out ca.crt
# 查看证书的状态
openssl x509 -noout -text -in ca.crt
# 上面生成的证书实际上是一个根证书，这个根证书可以对其他的证书请求进行签名，从而生成子证书,从而产生了证书的级联结构
# 如果一个客户端想要向CA server请求一个新的证书该怎么做呢？
# 首先客户端也需要生成自己的密钥对。如果客户端是CA server自己，那么这个请求CA证书的过程叫做自签名
# 要想请求证书，首先得生成一个请求csr，同样可以使用openssl命令来进行
openssl req -new -key ca.key -out server.csr
# 使用这个csr文件去请求证书
openssl x509 -req -days 20 -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt
# 得到一个自签名server.csr证书文件,同样使用openssl命令查看该证书状态
openssl x509 -noout -text -in server.crt
```
