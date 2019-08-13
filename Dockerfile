FROM ubuntu:16.04

WORKDIR /workdir

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools \
    git \
    g++ \
    make \
    cmake \
    libblas3 \
    libblas-dev \
    && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN pip3 install --upgrade pip

RUN export CHAINER_BUILD_CHAINERX=1
RUN export CHAINERX_BUILD_CUDA=1

RUN pip3 install -U --no-cache-dir \
    'ideep4py<2.1' \
    cupy-cuda92==6.2.0 \
    chainer==6.2.0 \
    scikit-learn \
    pandas \
    matplotlib \
    jupyterlab
