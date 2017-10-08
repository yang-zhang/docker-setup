FROM continuumio/anaconda:latest

# To automatically save a jupyter notebook as a python file
ADD dockerfiles/jupyter_notebook_config.py /root/.jupyter/


RUN \
  # W: GPG error: http://developer.download.nvidia.com  Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY F60F4B3D7FA2AF80
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F60F4B3D7FA2AF80 && \

#   wget -qO - http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/7fa2af80.pub | sudo apt-key add -

  # ensure system is updated and has basic build tools
  apt-get update && \
  apt-get --assume-yes upgrade && \
  apt-get --assume-yes install tmux build-essential gcc g++ make binutils && \
  apt-get --assume-yes install software-properties-common && \

  # download and install GPU drivers
  wget "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb" -O "cuda-repo-ubuntu1604_9.0.176-1_amd64.deb" && \

  dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb && \
  apt-get update && \
  apt-get -y install cuda && \
  modprobe nvidia && \
  nvidia-smi 
  
RUN \   
  conda install -y bcolz && \
  conda upgrade -y --all && \

  # install and configure theano
  pip install theano && \
  echo "[global] && \
  device = gpu && \
  floatX = float32 && \
  [cuda] && \
  root = /usr/local/cuda" > ~/.theanorc && \

  # install and configure keras
  pip install keras==1.2.2 && \
  mkdir ~/.keras && \
  echo '{ && \
      "image_dim_ordering": "th", && \
      "epsilon": 1e-07, && \
      "floatx": "float32", && \
      "backend": "theano" && \
  }' > ~/.keras/keras.json && \

  # install cudnn libraries
  wget "http://files.fast.ai/files/cudnn.tgz" -O "cudnn.tgz" && \
  tar -zxf cudnn.tgz && \
  cd cuda && \
  sudo cp lib64/* /usr/local/cuda/lib64/ && \
  sudo cp include/* /usr/local/cuda/include/ 

RUN \
  apt-get install zip unzip && \
  
  # jupyter nbextensions
  conda install -c conda-forge jupyter_contrib_nbextensions && \
  conda install -c conda-forge jupyter_nbextensions_configurator && \

  # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
  jupyter nbextension enable toc2/main && \
  
  pip install kaggle-cli
