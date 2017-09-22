#!/bin/sh

# Add to ~/.bash_profile:
# sh "path to docker-setup.sh"

dkrun() {
  if [ "$1" == "kaggle" ]; then
    docker run \
    --rm \
    -it \
    -p 8887:8887 \
    -v $PWD:/opt/notebooks \
    $1 \
    /bin/bash -c "/opt/conda/bin/jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8887 --no-browser \
    "
  elif [ "$1" == "r" ]; then
    docker run \
    --rm \
    -v $PWD:/home/rstudio \
    -p 8787:8787 \
    -e ROOT=TRUE \
    r
  else
    docker run \
    --rm \
    -it \
    -p 8887:8887 \
    -v $PWD:/opt/notebooks \
    $1 \
    /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
    /opt/conda/bin/jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8887 --no-browser \
    --allow-root
    "
  fi
}
