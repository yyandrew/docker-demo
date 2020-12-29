### 如何使用
#### 构建docker镜像
```
DOCKER_BUILDKIT=1 docker build -t postgres9.4-for-lldb . -f Dockerfile.postgres9.4-for-lldb
```
#### 运行镜像
```
docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --rm -it --name postgres9.4-for-lldb postgres9.4-for-lldb sh
```
