## Install Docker
Install [Docker](https://www.docker.com/) for [Mac](https://www.docker.com/docker-mac) or [PC](https://www.docker.com/docker-windows).

## Build images
### Image: `base`
[Dockerfile](https://github.com/yang-zhang/docker-setup/blob/master/base/Dockerfile)
```sh
$ ls base
Dockerfile			jupyter_notebook_config.py
$ docker build base --tag base
```
### Image: `r`
[Dockerfile](https://github.com/yang-zhang/docker-setup/blob/master/r/Dockerfile)
```sh
$ docker build r --tag r
```

## Run a container from an image
```sh
dkrun() {
	docker run \
	--rm \
	-it \
	-p 8888:8888 \
	-v ~/git:/opt/notebooks \
	$1 \
	/bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
	/opt/conda/bin/jupyter notebook \
	--notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser \
	--allow-root"
}
```
```sh
dkrun base
```
```sh
dkrun r
```
