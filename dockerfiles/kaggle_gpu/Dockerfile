FROM nvidia/cuda
ENV PATH="/opt/conda/bin:${PATH}"

RUN \
apt-get update && \
apt-get -y install wget
RUN apt-get -y install bzip2

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh
