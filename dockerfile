FROM ubuntu:22.04

RUN apt-get update && \
    apt-get -y install libvtk9.1-qt