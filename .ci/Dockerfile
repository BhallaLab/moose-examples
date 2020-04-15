FROM ubuntu:latest
MAINTAINER Dilawar Singh <dilawar.s.rajput@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y \
    python3-dev python3-matplotlib python3-pip \
    python3-networkx python3-scipy python3-numpy python3-pydot \
    graphviz && \
    rm -rf /var/lib/apt/lists/
WORKDIR /root
COPY . moose-examples
RUN cd moose-examples && ./.ci/run.sh
