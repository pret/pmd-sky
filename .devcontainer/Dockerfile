FROM ubuntu:22.04

# Link python -> python3 convenience
RUN ln -s python3 /usr/bin/python

# Basic utils
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bash-completion \
    build-essential \
    curl \
    git \
    gnupg \
    groff \
    make \
    pkg-config \
    unzip \
    software-properties-common \
    sudo \
    vim \
    wget \
    xvfb

# Decomp tools
RUN dpkg --add-architecture i386
RUN wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
RUN add-apt-repository ppa:cybermax-dexter/sdl2-backport
RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources
# We don't need Mono/Gecko
ENV WINEDLLOVERRIDES="mscoree=d;mshtml=d"
# Hide the annoying wine-internal "fixme" messages
ENV WINEDEBUG="fixme-all"
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-downgrades --install-recommends \
    g++-10-multilib \
    linux-libc-dev \
    binutils-arm-none-eabi \
    p7zip-full \
    libpng-dev \
    libpugixml-dev \
    winehq-stable

RUN apt-get clean

RUN useradd -m -s /bin/bash -g sudo muttski
# Passwordless sudo for convenience
RUN echo "muttski ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/muttski
USER muttski

ENV CC=gcc-10
ENV CXX=g++-10

COPY onCreate.sh /opt/devcontainer/
