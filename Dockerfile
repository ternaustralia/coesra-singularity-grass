FROM --platform=linux/amd64 ubuntu:22.04

# Update and install required packages
RUN apt-get update -y \
    && apt-get install -y \
    wget \
    gnupg \
    software-properties-common

ENV TZ=Australia
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

## Install qgis
RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable && apt-get update -y
RUN apt-get install -y grass

ENTRYPOINT ["/usr/bin/grass"]
