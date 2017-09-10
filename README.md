## Install Docker
Install [Docker](https://www.docker.com/) for [Mac](https://www.docker.com/docker-mac) or [PC](https://www.docker.com/docker-windows).

## The images
### Image: [`base`](https://github.com/yang-zhang/docker-setup/blob/master/base/Dockerfile)
Based on [`continuumio/anaconda3`](https://hub.docker.com/r/continuumio/anaconda3/) and:
- Automatically save notebook as python file for easier version control (see [here](https://github.com/yang-zhang/docker-setup/blob/master/save_notebook_as_py_file.md) detail)
- Add Jupyter nbextensions
- Enable favorite jupyter notebook extensions to run at start
### Image: [`ds`](https://github.com/yang-zhang/docker-setup/blob/master/ds/Dockerfile)
Based on [`base`](https://github.com/yang-zhang/docker-setup/blob/master/base/Dockerfile) and plus additional libraries.
### Image: [`kaggle`](https://github.com/yang-zhang/docker-setup/blob/master/kaggle/Dockerfile)
Based on [`Kaggle/docker-python`](https://github.com/Kaggle/docker-python) and plus [kaggle-cli](https://github.com/floydwch/kaggle-cli).
### Image: [`r`](https://github.com/yang-zhang/docker-setup/blob/master/r/Dockerfile)
Based on [rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse/) and plus addtional libraries.
## Build the images
Run this script [`build.py`](https://github.com/yang-zhang/docker-setup/blob/master/build.py) under the project root (`docker-setup`)  to build the images:
```sh
python build.py
```

Or you can run these from the terminal under the project root (`docker-setup`) to build the images:
```sh
$ docker build dockerfiles base --tag base
$ docker build dockerfiles ds --tag ds
$ docker build dockerfiles kaggle --tag kaggle
$ docker build dockerfiles r --tag r
```

## Run a container from an image
### Python images
#### Jupyter notebook
Run this from the terminal or add it to `.bash_profile`:
```sh
dkrun() {
	docker run \
	--rm \
	-it \
	-p 8888:8888 \
	-v $2:/opt/notebooks \
	$1 \
	/bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
	/opt/conda/bin/jupyter notebook \
	--notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser \
	--allow-root"
}
```
Run one of these from the terminal to run jupyter notebook within the respective image:
```sh
$ dkrun base ~/git
$ dkrun ds ~/git
$ dkrun kaggle ~/git
```
The first argument is the *name of the image*, and the second argument is the *local path to add*.

Go to `http://localhost:8888?token=[TOKEN]` to open jupyter notebook, where `[TOKEN]` is printed on the terminal when you run the above images.
#### Ipython
Run this from the terminal or add it to `.bash_profile`:
```sh
dkrun_ipython() {
	docker run \
	--rm \
	-it \
	-v $2:/tmp \
	$1 \
	/bin/bash -c "ipython"
}
```
Run one of these from the terminal to run ipython within the respective image:
```sh
$ dkrun_ipython base ~/git
$ dkrun_ipython ds ~/git
$ dkrun_ipython kaggle ~/git
```
The first argument is the *name of the image*, and the second argument is the *local path to add*.
### R images
Run this from the terminal or add it to `.bash_profile`:
```sh
dkrun_r() {
	docker run \
	--rm \
	-v $2:/home/rstudio \
	-p 8787:8787 \
	-e ROOT=TRUE \
	$1
}
```
The first argument is the *name of the image*, and the second argument is the *local path to add*.
Run this from the terminal to run rstudio within the image:
```sh
$ dkrun_r r ~/git
```
Go to `http://localhost:8787` to open rstudio, where username and password both are `rstudio`.
