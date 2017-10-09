FROM nvidia/cuda:9.0-cudnn7-runtime

RUN
# install Anaconda for current user
mkdir downloads && \
cd downloads && \
wget "https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh" -O "Anaconda2-4.2.0-Linux-x86_64.sh" && \
bash "Anaconda2-4.2.0-Linux-x86_64.sh" -b && \

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

  # jupyter nbextensions
  conda install -c conda-forge jupyter_contrib_nbextensions && \
  conda install -c conda-forge jupyter_nbextensions_configurator && \

  # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
  jupyter nbextension enable toc2/main && \
  
  pip install kaggle-cli
