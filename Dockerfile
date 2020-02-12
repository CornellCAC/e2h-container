FROM python:3.6-buster

SHELL ["/bin/bash", "-c"]

USER root

# install dependencies and useful tools
RUN apt-get update -y && apt-get install -y \
    sudo \
    cmake \
    liblapack-dev \
    libblas-dev \
    libopenmpi-dev \
    unzip \
    man \
    bash-completion \
    nano \ 
    vim \ 
    less \
    htop \
    tmux

# set up user
RUN useradd -mr -G sudo dev 
RUN passwd -d dev
RUN echo "dev  ALL=(ALL)       NOPASSWD: ALL"  >> /etc/sudoers

WORKDIR /home/dev

RUN pip3 install scikit-build \
    matplotlib

# install netket
RUN git clone https://github.com/kchoo1118/netket.git && \
    cd netket && \
    git checkout J1J2-V2.1 && \
    pip3 install .

# install e2h
RUN git clone https://bitbucket.org/skkestrel/e2h.git

# add data
RUN mkdir data
COPY json.zip /home/dev/data
COPY wavefunctions.zip /home/dev/data
RUN unzip data/json.zip && \
    unzip data/wavefunctions.zip

USER dev

