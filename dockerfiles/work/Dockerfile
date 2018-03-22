FROM continuumio/anaconda3

RUN apt-get -y install wget && \
    apt-get install -y unzip && \

    conda install -c conda-forge jupyter_contrib_nbextensions && \
    conda install -c conda-forge jupyter_nbextensions_configurator && \

    pip install yapf && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable code_prettify/code_prettify
