FROM ubuntu:latest

RUN \
# ensure system is updated and has basic build tools
apt-get update && \
apt-get --assume-yes upgrade && \
apt-get --assume-yes install tmux build-essential gcc g++ make binutils && \
apt-get --assume-yes install software-properties-common && \

apt-get --assume-yes install wget && \
apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub && \
# download and install GPU drivers
wget "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb" -O "cuda-repo-ubuntu1604_9.0.176-1_amd64.deb" && \

dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb && \ 
apt-get update && \
apt-get -y install cuda && \
modprobe nvidia && \
nvidia-smi && \

# install Anaconda for current user
mkdir downloads && \
cd downloads && \
wget "https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh" -O "Anaconda2-4.2.0-Linux-x86_64.sh" && \
bash "Anaconda2-4.2.0-Linux-x86_64.sh" -b && \

echo "export PATH=\"$HOME/anaconda2/bin:\$PATH\"" >> ~/.bashrc && \
export PATH="$HOME/anaconda2/bin:$PATH" && \
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
cp lib64/* /usr/local/cuda/lib64/ && \
cp include/* /usr/local/cuda/include/ 

RUN \
  
  # jupyter nbextensions
  conda install -c conda-forge jupyter_contrib_nbextensions && \
  conda install -c conda-forge jupyter_nbextensions_configurator && \

  # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
  jupyter nbextension enable toc2/main && \
  
  pip install kaggle-cli

