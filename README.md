1. Install [Docker](https://www.docker.com/) for [Mac](https://www.docker.com/docker-mac) or [PC](https://www.docker.com/docker-windows).
1. Docker images:
	1. [base](https://github.com/yang-zhang/docker-setup/blob/master/base/Dockerfile)
		1. Build
		   ```sh
		   $ ls base
			Dockerfile			jupyter_notebook_config.py
			ITs-MacBook-Pro:docker-setup yangzhang$ docker build base --tag base
			Sending build context to Docker daemon  4.608kB
			Step 1/3 : FROM continuumio/anaconda3:latest
			 ---> f3a9cb1bc160
			Step 2/3 : RUN conda install -c conda-forge jupyter_contrib_nbextensions &&     conda install -c conda-forge jupyter_nbextensions_configurator &&    jupyter nbextension enable toc2/main &&    jupyter nbextension enable code_prettify/code_prettify
			 ---> Using cache
			 ---> 8c4f41d8eb1d
			Step 3/3 : ADD jupyter_notebook_config.py /root/.jupyter/
			 ---> Using cache
			 ---> 55da8e2f4520
			Successfully built 55da8e2f4520
			Successfully tagged base:latest
			``` 	
		1. run_base() {
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







	
	
 docker run --rm -i -t -p 8888:8888 base /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"
 
 
