## Install Docker
Install [Docker](https://www.docker.com/) for [Mac](https://www.docker.com/docker-mac) [PC](https://www.docker.com/docker-windows), or [Linux](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) (for GPU).

## The images
### Image: [`base`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/base/Dockerfile)
Based on [`continuumio/anaconda3`](https://hub.docker.com/r/continuumio/anaconda3/) and:
- Automatically save notebook as python file for easier version control (see [here](https://github.com/yang-zhang/docker-setup/blob/master/save_notebook_as_py_file.md) detail)
- Add Jupyter nbextensions
- Enable favorite jupyter notebook extensions to run at start
### Image: [`ds`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/ds/Dockerfile)
Based on [`base`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/base/Dockerfile) and plus any additional libraries.
### Image: [`kaggle`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/kaggle/Dockerfile)
Based on [`Kaggle/docker-python`](https://github.com/Kaggle/docker-python) and plus [kaggle-cli](https://github.com/floydwch/kaggle-cli).
### Image: [`fastai1`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/fastai1/Dockerfile) 
For Jeremy Howard's [Practical Deep Learning For Coders, Part 1](http://course.fast.ai/), using gpu.
### Image: [`r`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/r/Dockerfile)
Based on [rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse/) and plus any addtional libraries.
### Image: [`tf`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/tf/Dockerfile)
Tensorflow using gpu and plus any addtional libraries.

## Build the images
Run this script [`build.py`](https://github.com/yang-zhang/docker-setup/blob/master/build.py) under the project root (`docker-setup`)  to build the images:
```sh
$ python build.py
```

Or you can run the `docker build` command from the terminal under the project root (`docker-setup`) to build the images. For example:
```sh
$ docker build -f dockerfiles/ds/Dockerfile . --tag ds
```

## Run a container from an image
From the terminal, run [docker-setup.sh](https://github.com/yang-zhang/docker-setup/blob/master/docker-setup.sh) to define shell command that runs the images:
```sh
$ source docker-setup.sh
```
Or Add to `.bash_profile` the line below so that it's automatically run when your machine starts:
```sh
source [path to docker-setup.sh]
```

Then you can run the above images:
- `dkrun base`
- `dkrun ds` 
- `dkrun kaggle`
- `dkrun_gpu fastai1`
- `dkrun_gpu tf`

For the above images, go to `http://localhost:8887?token=[TOKEN]` to open jupyter notebook, where `[TOKEN]` is printed on the terminal when you run the above images.

- `dkrun r`: Go to `http://localhost:8787` to open rstudio, where username and password both are `rstudio`.
