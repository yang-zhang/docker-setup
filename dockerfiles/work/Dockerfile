FROM continuumio/anaconda3

RUN conda update -n base conda && \

    # jupyter
    conda install -c conda-forge jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator && \  
    jupyter nbextension enable toc2/main && \
    # for jupyter code_prettify 
    pip install yapf && \
    jupyter nbextension enable code_prettify/code_prettify && \
   
    #xgboost
    apt-get install -y make && \
    apt-get install -y build-essential && \
    cd /usr/local/src && mkdir xgboost && cd xgboost && \
    git clone --depth 1 --recursive https://github.com/dmlc/xgboost.git && cd xgboost && \
    make && cd python-package && python setup.py install && \
    pip install lightgbm && \
            
    pip install kaggle-cli && \
    
    conda install -c conda-forge tensorflow && \

    conda install -c conda-forge theano && \

    conda install -c conda-forge keras && \ 

    conda install pytorch torchvision -c pytorch && \

    pip install mxnet && \

    # bcolz
    apt-get update && \
    apt-get install -y gcc && \
    apt-get install -y --reinstall build-essential && \
    pip install -U bcolz
