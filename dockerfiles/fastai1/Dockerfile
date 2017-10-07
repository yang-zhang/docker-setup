FROM continuumio/anaconda:latest

# To automatically save a jupyter notebook as a python file
ADD dockerfiles/jupyter_notebook_config.py /root/.jupyter/

RUN \
  # jupyter nbextensions
  conda install -c conda-forge jupyter_contrib_nbextensions && \
  conda install -c conda-forge jupyter_nbextensions_configurator && \

  # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
  jupyter nbextension enable toc2/main && \
  
  conda install -c anaconda bcolz && \
  conda install theano pygpu && \
  # Issue with new keras version 2.0.1. Instead use
  conda install -c conda-forge keras=1.2.2 && \
  conda install libpython && \

  pip install kaggle-cli
