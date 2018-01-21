# Dockerfile using Archlinux machine image

## Usage
Use [base/archlinux](https://hub.docker.com/r/base/archlinux/) image

```shell-session
$ docker pull base/archlinux
```


Run docker 

```shell-session
$ docker run -it u1and0/fish_first -v `pwd`:/home/docker
# ex) docker run -it {USERNAME}/{IMAGENAME} {SHELLNAME}
```


## Description

* User name is `docker`
* User shell is `fish` 
* sudo excute alwasy no password

