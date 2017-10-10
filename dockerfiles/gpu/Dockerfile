FROM nvidia/cuda:8.0-cudnn5-devel

ENV PATH="/opt/conda/bin:${PATH}"

RUN \
apt-get update && \
apt-get -y install wget

RUN apt-get -y install bzip2

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda2-5.0.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh
    
RUN \
conda install -y bcolz && \
conda upgrade -y --all

RUN \
# install and configure theano
pip install theano && \
echo "[global] \n\device = gpu \n\floatX = float32 \n\[cuda] \n\root = /usr/local/cuda" > ~/.theanorc 

RUN \
# install and configure keras
pip install keras==1.2.2 && \
mkdir ~/.keras && \
echo '{"image_dim_ordering": "th", \n\ "epsilon": 1e-07, \n\ "floatx": "float32", \n\ "backend": "theano"}' > ~/.keras/keras.json
#   # jupyter nbextensions
#   conda install -c conda-forge jupyter_contrib_nbextensions && \
#   conda install -c conda-forge jupyter_nbextensions_configurator && \

#   # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
#   jupyter nbextension enable toc2/main && \
  
#   pip install kaggle-cli
