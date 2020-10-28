# Docker Demo

## This is a demo of docker

## How to run docker image

```
docker pull lg201/hello-world
docker run -p 801:80 lg201/hello-world
```
Open [localhost:801](http://localhost:801)

## How to rebuild image

```sh
docker build -t lg201/hello-world .
```
