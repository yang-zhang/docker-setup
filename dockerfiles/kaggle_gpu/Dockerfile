FROM nvidia/cuda
ENV PATH="/opt/conda/bin:${PATH}"

# To automatically save a jupyter notebook as a python file
ADD dockerfiles/jupyter_notebook_config.py /root/.jupyter/

RUN apt-get update

RUN apt-get -y --fix-missing upgrade

RUN apt-get -y install wget

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

# jupyter nbextensions
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN conda install -c conda-forge jupyter_nbextensions_configurator

# FOR code_prettify
RUN pip install yapf
# Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
RUN jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify

RUN conda install -c anaconda tensorflow-gpu

# cntk https://docs.microsoft.com/en-us/cognitive-toolkit/Using-CNTK-with-Keras
RUN apt-get install  -y openmpi-bin
RUN pip install https://cntk.ai/PythonWheel/GPU/cntk-2.2-cp36-cp36m-linux_x86_64.whl


RUN conda install theano pygpu

RUN pip install -U keras

RUN apt-get -y install bzip2
RUN apt-get -y install unzip

RUN pip install -U kaggle-cli

RUN pip install praw

# opencv
RUN pip install opencv-python
RUN apt-get install -y libsm6
RUN apt-get install -y libxext6
RUN apt-get install -y libxrender1
RUN apt-get install -y libfontconfig1
RUN apt-get install -y libopenmpi-dev

