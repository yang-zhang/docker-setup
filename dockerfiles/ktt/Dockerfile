FROM nvidia/cuda

# To automatically save a jupyter notebook as a python file
ADD dockerfiles/jupyter_notebook_config.py /root/.jupyter/

RUN apt-get update

RUN apt-get -y install wget

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh
ENV PATH="/opt/conda/bin:${PATH}"

# jupyter nbextensions
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN conda install -c conda-forge jupyter_nbextensions_configurator

# FOR jupyter code_prettify 
RUN pip install yapf
# Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
RUN jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify

RUN conda install -c anaconda tensorflow-gpu

RUN conda install theano pygpu

RUN pip install -U keras

RUN pip install -U kaggle-cli
RUN apt-get -y install bzip2
RUN apt-get -y install unzip
RUN pip install praw
RUN pip install -U bcolz

# opencv
RUN pip install opencv-python
RUN apt-get install -y libsm6
RUN apt-get install -y libxext6
RUN apt-get install -y libxrender1
RUN apt-get install -y libfontconfig1

RUN conda install -c conda-forge imageio

# https://askubuntu.com/questions/917030/how-to-install-pydot-and-graphviz
RUN apt-get update
RUN apt-get install -y --fix-missing python-pydot python-pydot-ng graphviz
RUN conda install -c anaconda pydot

