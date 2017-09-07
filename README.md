1. Install [Docker](https://www.docker.com/) for [Mac](https://www.docker.com/docker-mac) or [PC](https://www.docker.com/docker-windows).
1. [Dockerfile](https://github.com/yang-zhang/docker-setup/blob/master/base/Dockerfile)
	1. `$ docker pull continuumio/anaconda3`

	
	
 docker run -i -t -p 8888:8888 29ab4e9ea4d3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"
 
 
