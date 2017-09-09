## Install
Install [Docker](https://www.docker.com/) for [Mac](https://www.docker.com/docker-mac) or [PC](https://www.docker.com/docker-windows).
## Images
### base
[Dockerfile](https://github.com/yang-zhang/docker-setup/blob/master/base/Dockerfile)
#### Build the image
```sh
$ ls base
Dockerfile			jupyter_notebook_config.py
$ docker build base --tag base
```
#### Run
```sh
run_base() {
docker run \
--rm \
-it 
-p 8888:8888 \
base \
/bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook \
--notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser \
--allow-root"
}
```






	
	
 docker run --rm -i -t -p 8888:8888 base /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"
 
 
