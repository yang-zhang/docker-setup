#!/bin/sh

# Add to ~/.bash_profile:
# sh "path to docker-setup.sh"

dkrun_ds() {
    sudo docker run \
    --rm \
    -it \
    -p 8888:8888 \
    -v $PWD:/opt/notebooks \
    -v ~/models/keras_models:/root/.keras/models \
    -v ~/tmp/keras_tmp:/root/.keras/tmp \
    ds \
    /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
    /opt/conda/bin/jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser \
    --allow-root
}

dkrun_kaggle() {
    sudo docker run \
    --rm \
    -it \
    -p 8888:8888 \
    -v $PWD:/opt/notebooks \
    -v ~/models/keras_models:/root/.keras/models \
    -v ~/tmp/keras_tmp:/root/.keras/tmp \
    kaggle \
    /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
    /opt/conda/bin/jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser \
    --allow-root
}

dkrun_ktt() {
    sudo docker run \
    --rm \
    --runtime=nvidia \
    -it \
    -p 8887:8887 \
    -v $PWD:/opt/notebooks \
    -v ~/models/keras_models:/root/.keras/models \
    -v ~/tmp/keras_tmp:/root/.keras/tmp \
    ktt \
    /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
    /opt/conda/bin/jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8887 --no-browser \
    --allow-root
    "
}

dkrun_fastai1() {
    sudo docker run \
    --rm \
    --runtime=nvidia \
    -it \
    -p 8887:8887 \
    -v $PWD:/opt/notebooks \
    -v ~/models/keras_models:/root/.keras/models \
    -v ~/tmp/keras_tmp:/root/.keras/tmp \
    fastai1 \
    /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && \
    /opt/conda/bin/jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8887 --no-browser \
    --allow-root
    "
}

dkrun_cntk() {
    sudo nvidia-docker run \
    -d -p 8887:8887 \
    --name cntk-jupyter-notebooks \
    -v $PWD:/opt/notebooks \
    -v ~/models/keras_models:/root/.keras/models \
    -v ~/tmp/keras_tmp:/root/.keras/tmp \
    -t cntk
    
    sudo docker exec \
    -it cntk-jupyter-notebooks \
    bash -c "source /cntk/activate-cntk && \
        jupyter-notebook --no-browser --port=8888 \
        --ip=0.0.0.0 --notebook-dir=/cntk/Tutorials --allow-root
     "
}

dkrun_r() {
    sudo docker run \
    --rm \
    -v $PWD:/home/rstudio \
    -p 8787:8787 \
    -e ROOT=TRUE \
    r    
}


