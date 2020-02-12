FROM python:3.6-buster

SHELL ["/bin/bash", "-c"]

USER root

# set up user
RUN useradd -mr -G sudo dev 
RUN passwd -d dev

WORKDIR /home/dev

# install dependencies and useful tools
RUN apt-get update -y && apt-get install -y \
    sudo \
    cmake \
    liblapack-dev \
    libblas-dev \
    libopenmpi-dev \
    man \
    bash-completion \
    nano \ 
    vim \ 
    less \
    htop \
    tmux 

RUN pip3 install scikit-build \
    matplotlib

# install netket
RUN git clone https://github.com/kchoo1118/netket.git && \
    cd netket && \
    git checkout J1J2-V2.1 && \
    pip3 install .

# install e2h
RUN git clone https://bitbucket.org/skkestrel/e2h.git

USER dev

