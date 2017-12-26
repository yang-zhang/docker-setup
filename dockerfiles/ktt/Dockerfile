FROM nvidia/cuda

# To automatically save a jupyter notebook as a python file
ADD dockerfiles/jupyter_notebook_config.py /root/.jupyter/

# anaconda
RUN apt-get update && \
    apt-get -y install wget && \
    echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh
ENV PATH="/opt/conda/bin:${PATH}"


# tensorflow
RUN conda install -c anaconda tensorflow-gpu && \
    conda update tensorflow-gpu  && \
    # https://stackoverflow.com/questions/45952387/anaconda-install-of-tensorflow-missing-audio-ops-from-contrib-framework
    pip install tf-nightly

# theano
RUN conda install theano pygpu

# keras
RUN pip install -U keras

# pytorch
RUN conda install pytorch torchvision cuda80 -c soumith


# jupyter nbextensions
RUN conda install -c conda-forge jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator  && \
    # FOR jupyter code_prettify 
    pip install yapf
    # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify

# opencv
RUN pip install opencv-python && \
    apt-get install -y libsm6 && \
    apt-get install -y libxext6 && \
    apt-get install -y libxrender1 && \
    apt-get install -y libfontconfig1

RUN conda install -c conda-forge imageio

# https://askubuntu.com/questions/917030/how-to-install-pydot-and-graphviz
RUN apt-get update && \
    apt-get install -y --fix-missing python-pydot python-pydot-ng graphviz && \
    conda install -c anaconda pydot

# xgboost
RUN apt-get install -y cmake && \
    cd /usr/local/src && mkdir xgboost && cd xgboost&& \
    git clone --depth 1 --recursive https://github.com/dmlc/xgboost.git && cd xgboost && \
    mkdir build && \
    cd build && \
    cmake .. -DUSE_CUDA=ON && \
    make -j && \
    cd ../python-package && python setup.py install  && \
    conda install libgcc


# ffmpeg
RUN apt-get clean && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -f && \
    apt-get install -y --fix-missing software-properties-common python-software-properties && \
    add-apt-repository ppa:mc3man/trusty-media  && \
    apt-get install -y ffmpeg && \
    apt-get install -y frei0r-plugins

RUN pip install -U kaggle-cli && \
    pip install praw && \
    pip install -U bcolz  && \
    pip install --upgrade gensim  && \
    pip install --upgrade keras-tqdm  && \
    apt-get update && \
    apt-get -y install git && \
    apt-get -y install bzip2 && \
    apt-get -y install unzip && \
    apt-get -y install p7zip-full 
