FROM continuumio/anaconda3

RUN conda update -n base conda && \
    conda install -c conda-forge jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator && \
    pip install yapf && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify
    #xgboost
RUN apt-get install -y --reinstall make 
RUN cd /usr/local/src && mkdir xgboost && cd xgboost && \
    git clone --depth 1 --recursive https://github.com/dmlc/xgboost.git && cd xgboost && \
    make && cd python-package && python setup.py install && \
    pip install lightgbm
