### 如何使用
#### 构建docker镜像
```
DOCKER_BUILDKIT=1 docker build -t sqlite3 . -f Dockerfile.sqlite3
```
#### 运行镜像
```
 docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --rm -it --name sqlite3 sqlite3 sh
```
