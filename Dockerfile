FROM centos

RUN yum install -y epel-release
RUN yum install -y gcc gcc-c++ cmake libconfig libconfig-devel jansson-devel
RUN yum install -y luajit luajit-devel postgresql postgresql-devel zeromq zeromq-devel

COPY ./ffmpeg-3.4.4.tar.gz /build/ffmpeg/