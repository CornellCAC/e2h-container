FROM python:3.6-buster

SHELL ["/bin/bash", "-c"]

USER root

# install dependencies
RUN apt-get update -y && apt-get install -y \
    cmake \
    liblapack-dev \
    libblas-dev \
    libopenmpi-dev

RUN pip3 install scikit-build

# install netket
RUN git clone https://github.com/kchoo1118/netket.git && \
    cd netket && \
    git checkout J1J2-V2.1 && \
    pip3 install .

# install e2h
RUN git clone https://bitbucket.org/skkestrel/e2h.git



