## Install Docker
Install [Docker](https://www.docker.com/) for [Mac](https://www.docker.com/docker-mac) or [PC](https://www.docker.com/docker-windows).

## The images
### Image: [`base`](https://github.com/yang-zhang/docker-setup/blob/master/base/Dockerfile)
Based on [`continuumio/anaconda3`](https://hub.docker.com/r/continuumio/anaconda3/) and:
- Automatically save notebook as python file for easier version control (see [here](https://github.com/yang-zhang/docker-setup/blob/master/save_notebook_as_py_file.md) detail)
- Add Jupyter nbextensions
- Enable favorite jupyter notebook extensions to run at start
### Image: [`ds`](https://github.com/yang-zhang/docker-setup/blob/master/ds/Dockerfile)

### Image: [`kaggle`](https://github.com/yang-zhang/docker-setup/blob/master/kaggle/Dockerfile)
Based on [`Kaggle/docker-python`](https://github.com/Kaggle/docker-python) and added [kaggle-cli](https://github.com/floydwch/kaggle-cli)

### Image: [`r`](https://github.com/yang-zhang/docker-setup/blob/master/r/Dockerfile)

## Build the images
Run this from the terminal under the project root (`docker-setup`) or add it to `.bash_profile`:
```sh
dkbuild() {
	docker build $1 --tag $1
}
```
Run these from the terminal to build the images:
```sh
$ dkbuild base
$ dkbuild ds
$ dkbuild kaggle
$ dkbuild r
```

## Run a container from an image
### Python images
#### Jupyter notebook
Run this from the terminal under the project root (`docker-setup`) or add it to `.bash_profile`:
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
Run one of these from the terminal to run jupyter notebook within the respective image:
```sh
$ dkrun base
$ dkrun ds
$ dkrun kaggle
```
Go to `http://localhost:8888` to open jupyter notebook.
#### Ipython
Run this from the terminal under the project root (`docker-setup`) or add it to `.bash_profile`:
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
Run one of these from the terminal to run ipython within the respective image:
```sh
$ dkrun_ipython base
$ dkrun_ipython ds
$ dkrun_ipython kaggle
```
### R images
Run this from the terminal under the project root (`docker-setup`) or add it to `.bash_profile`:
```sh
alias dkrunr="docker run --rm -v ~/git:/home/rstudio -p 8787:8787 -e ROOT=TRUE r"
```
Run this from the terminal to run rstudio within the image:
```sh
$ dkrun r
```
Go to `http://localhost:8787` to open rstudio, where username and password both are `rstudio`.
