FROM continuumio/anaconda3:latest

# To automatically save a jupyter notebook as a python file
ADD jupyter_notebook_config.py /root/.jupyter/

RUN \

  # jupyter nbextensions
  conda install -c conda-forge jupyter_contrib_nbextensions && \
  conda install -c conda-forge jupyter_nbextensions_configurator && \

  # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
  jupyter nbextension enable toc2/main

