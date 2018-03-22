FROM continuumio/anaconda3

RUN apt-get -y install wget && \
    apt-get install -y unzip && \

    conda install -c conda-forge jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator && \

    # FOR jupyter code_prettify 
    pip install yapf && \
    # Enable favorite jupyter notebook extensions (https://github.com/ipython-contrib/jupyter_contrib_nbextensions#3-enablingdisabling-extensions)
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify
