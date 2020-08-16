FROM ubuntu:18.04

LABEL maintainer="Chao Lyu <lc91926@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt update && \
    apt-get -y install sudo && \
    apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev \ 
    libz-dev patch python3.5 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex \ 
    uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto \ 
    qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib \ 
    antlr3 gperf wget swig rsync && \
    apt-get clean

RUN useradd -m openwrt && \
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt