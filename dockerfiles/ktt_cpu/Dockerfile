FROM continuumio/anaconda3

# To automatically save a jupyter notebook as a python file
# ADD dockerfiles/jupyter_notebook_config.py /root/.jupyter/

RUN apt-get -y install wget && \
    apt-get install -y unzip && \

    conda install -c conda-forge jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator && \

    # FOR jupyter code_prettify 
    pip install yapf && \
    # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify && \

    conda install -c conda-forge tensorflow && \

    conda install -c conda-forge theano && \

    conda install -c conda-forge keras && \ 

    conda install pytorch torchvision -c pytorch && \

    # bcolz
    apt-get update && \
    apt-get install -y gcc && \
    apt-get install -y --reinstall build-essential && \
    pip install -U bcolz
