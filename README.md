## Install Docker
Install [Docker](https://www.docker.com/) for [Mac](https://www.docker.com/docker-mac) or [PC](https://www.docker.com/docker-windows).

## The images
### Image: [`base`](https://github.com/yang-zhang/docker-setup/blob/master/base/Dockerfile)
### Image: [`ds`](https://github.com/yang-zhang/docker-setup/blob/master/ds/Dockerfile)
### Image: [`kaggle`](https://github.com/yang-zhang/docker-setup/blob/master/kaggle/Dockerfile)
### Image: [`r`](https://github.com/yang-zhang/docker-setup/blob/master/r/Dockerfile)

## Build the images
```sh
dkbuild() {
	docker build $1 --tag $1
}
```

```sh
$ dkbuild base
$ dkbuild ds
$ dkbuild kaggle
$ dkbuild r
```

## Run a container from an image
### Python images
#### Jupyter notebook
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
$ dkrun base
$ dkrun ds
$ dkrun kaggle
```
Go to `http://localhost:8888` to open jupyter notebook.
#### IPyhton
```sh
dkrun_ipython() {
	docker run \
	--rm \
	-it \
	-v ~/git:/tmp \
	$1 \
	/bin/bash -c "ipython"
}
```
```sh
$ dkrun_ipython base
$ dkrun_ipython ds
$ dkrun_ipython kaggle
```
### R images
```sh
alias dkrunr="docker run --rm -v ~/git:/home/rstudio -p 8787:8787 -e ROOT=TRUE r"
```
```sh
$ dkrun r
```
Go to `http://localhost:8787` to open rstudio, where username and password both are `rstudio`.
