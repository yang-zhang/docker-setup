FROM nvidia/cuda

RUN apt-get update

RUN apt-get -y install wget
RUN apt-get -y install bzip2

ENV PATH="/opt/conda/bin:${PATH}"
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh
RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O ~/anaconda.sh 
RUN /bin/bash ~/anaconda.sh -b -p /opt/conda 
RUN rm ~/anaconda.sh

RUN apt-get -y install openmpi-bin
RUN pip install https://cntk.ai/PythonWheel/GPU/cntk-2.2-cp36-cp36m-linux_x86_64.whl

RUN pip install -U keras
