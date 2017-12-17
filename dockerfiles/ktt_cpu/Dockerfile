FROM continuumio/anaconda3

# To automatically save a jupyter notebook as a python file
ADD dockerfiles/jupyter_notebook_config.py /root/.jupyter/

# jupyter nbextensions
RUN conda install -c conda-forge jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator

# FOR jupyter code_prettify 
RUN pip install yapf
# Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
RUN jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify

RUN conda install -c conda-forge tensorflow

RUN conda install -c conda-forge theano 

RUN conda install -c conda-forge keras 

RUN conda install pytorch torchvision -c pytorch

RUN pip install -U bcolz
