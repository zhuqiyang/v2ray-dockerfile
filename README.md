# v2ray-dockerfile
构建好的docker镜像运行v2ray和privoxy两个进程，将v2ray的VMess协议转换成http协议，可以直接在linux中设置 http_proxy=127.0.0.1::8118 变量来设置代理。

#### 构建镜像：
```console
docker build -t proxy:0.1 .
```

#### 运行镜像：
```console
docker run --rm --name proxy -p 8118:8118 -e PORT=83 -e IP=100.100.100.100 -d proxy:0.1
```

#### 设置代理：
通过设置linux变量来设置代理。
```console
cat > proxy.sh <<EOF
export PROXY_HOST=127.0.0.1
export all_proxy=http://\$PROXY_HOST:8118
export ftp_proxy=http://\$PROXY_HOST:8118
export http_proxy=http://\$PROXY_HOST:8118
export https_proxy=http://\$PROXY_HOST:8118
export no_proxy=localhost,172.16.0.0/16,192.168.1.0/24,127.0.0.1,10.10.0.0/16,10.244.0.0/16
EOF

source proxy.sh
```

#### 取消代理：
取消变量即可取消代理。
```console
cat > unproxy.sh <<EOF
unset PROXY_HOST
unset all_proxy
unset ftp_proxy
unset http_proxy
unset https_proxy
unset no_proxy
EOF

source unproxy.sh
```
