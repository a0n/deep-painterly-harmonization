FROM nvidia/cuda:8.0-cudnn7-devel

ENV PROJECT_PATH /deep-painterly-harmonization
env TORCH_PATH /opt/torch

RUN apt-get update \
    && apt-get install -y octave libprotobuf-dev protobuf-compiler git build-essential sudo

RUN git clone --depth 1 https://github.com/torch/distro.git $TORCH_PATH --recursive \
    && cd $TORCH_PATH; bash install-deps \
    && bash -c "./install.sh"
RUN luarocks install loadcaffe
RUN mkdir -p $PROJECT_PATH
WORKDIR $PROJECT_PATH
