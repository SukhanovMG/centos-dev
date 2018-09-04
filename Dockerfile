FROM centos

RUN yum install -y epel-release
RUN yum install -y gcc gcc-c++ cmake libconfig libconfig-devel jansson-devel
RUN yum install -y luajit luajit-devel postgresql postgresql-devel zeromq zeromq-devel


# install ffmpeg
RUN yum install -y yasm

COPY    ./ffmpeg-3.4.4.tar.gz /build/ffmpeg/
WORKDIR /build/ffmpeg/
RUN     tar -xzf ffmpeg-3.4.4.tar.gz
