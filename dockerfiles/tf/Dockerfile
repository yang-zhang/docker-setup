FROM nvidia/cuda:8.0-cudnn6-devel

ENV PATH="/opt/conda/bin:${PATH}"

RUN \
apt-get update && \
apt-get -y install wget && \
echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
rm ~/anaconda.sh
