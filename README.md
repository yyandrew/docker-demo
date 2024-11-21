# Docker Demo of ovpn to socks

## How to start service

1. Download ovpn config file into `~/openvpn` folder
2. Add pass.txt after line `auth-user-pass` of the ovpn config file
3. Put credentials into file `~/openvpn/pass1.txt`
4. Start docker service by command below
```sh
docker-compose up -d ovpn2socks
```
