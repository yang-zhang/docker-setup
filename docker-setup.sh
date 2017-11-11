#!/bin/sh

# Add to ~/.bash_profile:
# sh "path to docker-setup.sh"

dkrun() {
  if [ "$1" == "r" ]; then
    sudo docker run \
    --rm \
    -v $PWD:/home/rstudio \
    -p 8787:8787 \
    -e ROOT=TRUE \
    r
  else
    sudo docker run \
    --rm \
    -it \
    -p 8888:8888 \
    -v $PWD:/opt/notebooks \
    $1 \
    /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
    /opt/conda/bin/jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser \
    --allow-root
    "
  fi
}

dkrun_gpu() {
    sudo docker run \
    --rm \
    --runtime=nvidia \
    -it \
    -p 8887:8887 \
    -v $PWD:/opt/notebooks \
    -v ~/models/keras_models:/root/.keras/models \
    -v ~/tmp/keras_tmp:/root/.keras/tmp \
    $1 \
    /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
    /opt/conda/bin/jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8887 --no-browser \
    --allow-root
    "
}
