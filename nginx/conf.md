# 配置解析

通用匹配

```conf
location / {
    root /var/www/html;
}
```

精确匹配,只能匹配 '/' 后面如果添加其他路由是无法匹配的

```conf
location =/ {
    root /var/www/html;
}
```

正则匹配, \* 代表不区分大小写, 去掉 \* 表示区分大小写

```conf
location ~* /ca {
    root /var/www/html;
}

location ~ /CA {
    root /var/www/html;
}
```

精准前缀匹配, 只能匹配以ca开头的下一级

```conf
location ^~ /ca {
    root /var/www/html;
}
```

在多个匹配规则同时存在时，精确匹配优先级最高，其次是精准前缀匹配，然后是区分大小写的正则匹配，再然后是不区分大小写的正则匹配，最后是通用匹配

## 跨域配置与防盗链

在server块的配置中进行配置跨域支持

```conf
#允许跨域请求的域，*代表所有
add_header 'Access-Control-Allow-Origin' *;
#允许带上cookie请求
add_header 'Access-Control-Allow-Credentials' 'true';
#允许请求的方法，比如 GET/POST/PUT/DELETE，*代表所有方法
add_header 'Access-Control-Allow-Methods' *;
#允许请求的header，*代表所有的header
add_header 'Access-Control-Allow-Headers' *;
```

防盗链配置

```conf
#对发送请求的域名验证
valid_referers *.domain.com; 
#验证不通过则返回404
if ($invalid_referer) {
    return 404;
} 
```

## 负载均衡策略

### 轮询

轮询策略下，所有上游服务器被访问到的概率是一致的，且是按照一定的顺序依次被请求到。如下示例配置，hdh100:9001、hdh100:9002和hdh100:9003三台tomcat服务器依次被请求，每刷新一次就切换一次

```conf
#上游tomcat集群
upstream www.learn.com{
        server hdh100:9001;
        server hdh100:9002;
        server hdh100:9003;
}

#反向代理服务器
server {
        listen 80;
        server_name www.learn.com;

        location / {
            proxy_pass http://www.learn.com;
        }
}
```

### 加权轮询

加权轮询策略下，是按照每个上游服务器分配的权重不同处理的连接数也不同，权重越大，被访问到的次数就越多。如下示例配置，hdh100:9001、hdh100:9002和hdh100:9003的权重分别是1，3，5，权重越大，被分配的流量就越多

```conf
#上游tomcat集群，后面weight就是配置权重，在设置weight时，默认权重是1
upstream www.learn.com{
        server hdh100:9001 weight=1;
        server hdh100:9002 weight=3;
        server hdh100:9003 weight=5;
}

#反向代理服务器
server {
        listen 80;
        server_name www.learn.com;

        location / {
            proxy_pass http://www.learn.com;
        }
}
```

### ip_hash

ip_hash是根据用户的ip进行hash散列将其请求分配到指定上游服务器。在用户ip没有发生变化的情况下，且上游服务器无变更时，用户的多次请求都会被转发到同一台上游服务器。

且在使用ip_hash负责均衡策略时，如果需要临时删除其中一台服务器，则应使用down参数对其进行标记，以便保留客户端IP地址的当前哈希值

```conf
upstream www.learn.com{
        ip_hash;

        server hdh100:9001 weight=1;
        server hdh100:9002 weight=3;
        server hdh100:9003 weight=5;
}
```

### url_hash

url_hash策略是根据url进行hash散列将其请求分配到指定的上游服务器。同一个url在上游服务器没有发生变更的情况下是请求到同一台服务器

```conf
upstream www.learn.com{
        hash $request_uri;

        server hdh100:9001 weight=1;
        server hdh100:9002 weight=3;
        server hdh100:9003 weight=5;
}
```

### last_conn

last_conn将流量分发到当前连接数最少的服务器上的一个策略

```conf
upstream www.learn.com{
        least_conn;

        server hdh100:9001 weight=1;
        server hdh100:9002 weight=3;
        server hdh100:9003 weight=5;
}
```

## 优化配置

限制上游服务器的最大连接数，用于保护避免过载，可以起到限流的作用

```conf
#上游服务器配置，每个服务器都可以设置max_conns
upstream www.learn.com{
        server hdh100:9001 max_conns=200;
        server hdh100:9002 max_conns=200;
        server hdh100:9003 max_conns=200;
}
```

slow_start, 缓慢开始，当我们给上游服务器设置权重时，在配置了slow_start的情况下，该服务的权重是从0在配置的时间内慢慢增长到所配置的权重，该配置目前是在商业版本的nginx中生效
如下配置则表示hdh100:9003这个服务，在启动后的60s内权重是从0慢慢提升到5

```conf
#上游服务器配置，给hdh100:9003配置了权重5和slow_start 60s，则在集群启动后该服务器的权重是在60s的时间内慢慢从0变为5
upstream www.learn.com{
        server hdh100:9001 weight=1;
        server hdh100:9002 weight=3;
        server hdh100:9003 weight=5 slow_start=60s;
}
```

down和backup, down是将标记的服务器移除当前的服务器集群，被标记的服务器不会被访问到。
backup表示的是备用的意思，即在其他服务器可以提供服务的时候被backup标记的服务器不会被访问到，当其他服务器都挂掉后，backup标记的服务开始提供服务

```conf
#down配置示例，如下配置，则hdh100:9001这台服务器是不能提供服务的，不会被分配流量
upstream www.learn.com{
        server hdh100:9001 down;
        server hdh100:9002;
        server hdh100:9003;
}

#backup配置示例，如下配置，在hdh100:9002和hdh100:9003正常服务的时候，hdh100:9001不会提供服务，仅当另外两台服务都挂掉后，hdh100:9001开始提供服务
upstream www.learn.com{
        server hdh100:9001 backup;
        server hdh100:9002;
        server hdh100:9003;
}
```

max_fails和fail_timeout
max_fails是一个验证服务器是否能提供正常服务的校验，需结合fail_timeout使用，表示在一定时间段内请求当前服务失败的次数超过该值时，则认为该服务宕机失败掉，就将该服务剔除上游服务器集群，不再给其分配访问流量。
fail_timeout表示失败服务的重试时间，即当该服务器被认为宕机失败时，间隔指定时间后再来重新尝试请求，如果仍请求失败则继续间隔指定时间再尝试请求，一直重复这种行为

```conf
#如下是示例配置，表示在30s的时间内请求hdh100:9001的失败次数超过10次时，则认为hdh100:9001服务宕机，则随后的30s内该服务器不再被分配请求，30s后会重新尝试请求该服务器，若仍然请求失败，则重复上述行为
upstream www.learn.com{
        server hdh100:9001 max_fails=10 fail_timeout=30s;
        server hdh100:9002;
        server hdh100:9003;
}
```

keepalive 设置nginx和上游服务器直接保持的长连接数量，目的是为了减少创建连接和关闭连接的损耗

```conf
#如下示例，设置保持的长连接数量为32
upstream www.learn.com{
        server hdh100:9001 max_fails=10 fail_timeout=30s;
        server hdh100:9002;
        server hdh100:9003;

        keepalive 32
}

#设置http版本为1.1，默认是http1.0版本是短连接
#设置Connection header为空
server {
        listen 80;
        server_name www.learn.com;

        location / {
                proxy_pass http://www.learn.com;
                proxy_http_version 1.1;
                proxy_set_header Connection "";
        }
}
```

## 缓存配置

nginx缓存, 浏览器中的缓存加快单个用户浏览器的访问的速度，缓存是存在浏览器本地

```conf
location / {
        root   html;
        index  index.html;

        #设置缓存过期时间为10s
        # expires 10s;
        #设置具体到期时间，如下示例代表缓存过期时间为晚上10点30分时
        # expires @22h30m;
        #设置过期时间为现在的前一个小时，则代表不使用缓存
        # expires -1h;
        #设置不使用缓存
        # expires epoch;
        # nginx关闭expires，则缓存机制是根据浏览器而定的
        # expires off;
        #设置缓存过期时间最大
        # expires max;
}
```

### nginx反向代理缓存

反向代理缓存是将，要代理的上游服务器的数据缓存在nginx端，目的是为了提升访问nginx端的用户的访问速度

```conf
#proxy_cache_path 设置存储存储目录
#keys_zone 设置名称以及共享内存大小
#max_size 设置缓存大小
#inactive设置缓存过期时间，超过该时间则被清理
#use_temp_path设置是否使用临时目录，默认是使用，在这里设置关闭
proxy_cache_path /home/local/cache  keys_zone=learncache:5m max_size=2g inactive=60s use_temp_path=off;

server {
    listen 80;
    server_name www.learn.com;

    #开启缓存
    proxy_cache learncache;
    #对200和304状态的请求设置缓存过期时间
    proxy_cache_valid 200 304 1h;

    location / {
        proxy_pass http://www.learn.com;
    }
}
```
