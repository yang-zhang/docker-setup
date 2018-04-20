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
### Image: [`ktt`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/ktt/Dockerfile)
Keras with Tensorflow and Theano, using gpu.
### Image: [`fastai1`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/fastai1/Dockerfile) 
For Jeremy Howard's [Practical Deep Learning For Coders, Part 1](http://course.fast.ai/), using gpu.
### Image: [`r`](https://github.com/yang-zhang/docker-setup/blob/master/dockerfiles/r/Dockerfile)
Based on [rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse/) and plus any addtional libraries.

## Build the images
You can run the `docker build` command from the terminal under the project root (`docker-setup`) to build the images. For example:
```sh
$ sudo docker build -f dockerfiles/ktt/Dockerfile . -t ktt
$ sudo docker build -f dockerfiles/work/Dockerfile . -t work
```
Or run this script [`build.py`](https://github.com/yang-zhang/docker-setup/blob/master/build.py) under the project root (`docker-setup`)  to build the images:
```sh
$ python build.py
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

Then you can run the above images, e.g.:
- `dkrun_ktt`
- `dkrun_fastai1`
- `dkrun_kaggle`
- `dkrun_r`

For the above images, go to `http://localhost:[PORT]?token=[TOKEN]` to open jupyter notebook, as printed on the terminal when you run the above images.

- `dkrun_r`: Go to `http://localhost:8787` to open rstudio, where username and password both are `rstudio`.
