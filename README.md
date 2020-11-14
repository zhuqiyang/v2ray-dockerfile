# v2ray-dockerfile
构建镜像：
console```
docker build -t proxy:0.1 .
```

运行镜像：
console```
docker run --rm --name proxy -p 8118:8118 -e PORT=83 -e IP=100.100.100.100 -d proxy:0.1
```
