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
RUN conda install -c conda-forge jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator
# FOR jupyter code_prettify 
RUN pip install yapf
# Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
RUN jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify && \
    jupyter nbextension enable jupyter-tensorboard


RUN conda install theano pygpu

RUN pip install -U keras

RUN conda install pytorch torchvision cuda80 -c soumith

RUN pip install -U kaggle-cli
RUN apt-get -y install bzip2
RUN apt-get -y install unzip
RUN apt-get -y install p7zip-full
RUN pip install praw
RUN pip install -U bcolz

RUN apt-get update
RUN apt-get -y install git

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

# xgboost
RUN apt-get install -y cmake
RUN cd /usr/local/src && mkdir xgboost && cd xgboost && \
    git clone --depth 1 --recursive https://github.com/dmlc/xgboost.git && cd xgboost && \
    mkdir build && \
    cd build && \
    cmake .. -DUSE_CUDA=ON && \
    make -j && \
    cd ../python-package && python setup.py install 
RUN conda install libgcc

RUN pip install --upgrade gensim
RUN pip install --upgrade keras-tqdm

# ffmpeg
RUN apt-get clean
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -f
RUN apt-get install -y --fix-missing software-properties-common python-software-properties
RUN add-apt-repository ppa:mc3man/trusty-media  
RUN apt-get install -y ffmpeg
RUN apt-get install -y frei0r-plugins

# tf
RUN conda install -c anaconda tensorflow-gpu
RUN conda update tensorflow-gpu
# https://stackoverflow.com/questions/45952387/anaconda-install-of-tensorflow-missing-audio-ops-from-contrib-framework
RUN pip install tf-nightly

# https://docs.bazel.build/versions/master/install-ubuntu.html
# RUN add-apt-repository ppa:fossfreedom/packagefixes
# RUN apt-get update
RUN apt-get install -y zenity
RUN wget https://launchpad.net/~fossfreedom/+archive/packagefixes/+files/banish404_0.1-4_all.deb
RUN dpkg -i banish404_0.1-4_all.deb
RUN banish404
RUN apt-get install -y openjdk-8-jdk
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
# RUN apt-get install ppa-purge 
# RUN ppa-purge ppa:mc3man/trusty-media
# RUN add-apt-repository -y ppa:mc3man/xerus-media
# RUN add-apt-repository -y -r ppa:chris-lea/node.js
# RUN rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list
# RUN rm -f /etc/apt/sources.list.d/ppa_chris_lea_node_js_*
# RUN rm -f /etc/apt/sources.list.d/upubuntu-com-ppa-trusty*
RUN apt-get update 
RUN apt-get install -y bazel
RUN apt-get upgrade bazel
