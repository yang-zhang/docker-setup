FROM nvidia/cuda:9.0-cudnn7-runtime

RUN \
apt-get update && \
apt-get -y install wget && \

# install Anaconda for current user
mkdir downloads && \
cd downloads && \
wget "https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh" -O "Anaconda2-4.2.0-Linux-x86_64.sh" | bash

