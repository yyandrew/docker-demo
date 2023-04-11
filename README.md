# Etcd docker compose

## How to

```
$ docker compose pull
[+] Running 10/10
 ✔ etcd-3 Skipped - Image is already being pulled by etcd-2                               0.0s
 ✔ etcd-1 Skipped - Image is already being pulled by etcd-2                               0.0s
 ✔ etcd-2 7 layers [⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                      28.3s                                                                                               ✔ fc251a6e7981 Pull complete                                                          14.4s
   ✔ 0337b2960746 Pull complete                                                          14.5s                                                                                               ✔ ea22f9e7f845 Pull complete                                                          14.7s
   ✔ dc3e288f6d1f Pull complete                                                          14.8s
   ✔ e52e27415a6c Pull complete                                                          15.0s
   ✔ b199b19bb415 Pull complete                                                          15.1s
   ✔ 52b9c3886085 Pull complete                                                          15.3s
$ docker-compose up -d
[+] Running 6/6
 ✔ Volume "docker-demo_etcd1"      Created                                                0.0s
 ✔ Volume "docker-demo_etcd2"      Created                                                0.0s
 ✔ Volume "docker-demo_etcd3"      Created                                                0.0s
 ✔ Container docker-demo-etcd-2-1  Started                                                0.9s
 ✔ Container docker-demo-etcd-3-1  Started                                                0.6s
 ✔ Container docker-demo-etcd-1-1  Started                                                0.9s

# check health of nodes
$ docker exec -it docker-demo-etcd-1-1 etcdctl endpoint health
127.0.0.1:2379 is healthy: successfully committed proposal: took = 2.356355ms
$ docker exec -it docker-demo-etcd-2-1 etcdctl endpoint health
127.0.0.1:2379 is healthy: successfully committed proposal: took = 2.659742ms
$ docker exec -it docker-demo-etcd-3-1 etcdctl endpoint health
127.0.0.1:2379 is healthy: successfully committed proposal: took = 2.694113ms

$ docker exec -it docker-demo-etcd-1-1 etcdctl put secret password
OK

$ docker exec -it docker-demo-etcd-2-1 etcdctl get secret
secret
password

$ docker exec -it docker-demo-etcd-3-1 etcdctl get secret
secret
password
```

## How to stop image

```sh
docker-compose stop
```
