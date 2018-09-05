FROM centos:7

RUN    yum install -y epel-release \
    && yum install -y gcc gcc-c++ make cmake libconfig libconfig-devel jansson-devel luajit luajit-devel postgresql postgresql-devel  \
       zeromq zeromq-devel libev libev-devel libxml2 libxml2-devel yasm openssl openssl-devel openssl-libs libuuid libuuid-devel \
    && yum clean all && rm -rf /var/cache/yum

# install ffmpeg
COPY    ./ffmpeg-3.4.4.tar.gz /build/ffmpeg/
WORKDIR /build/ffmpeg/
RUN    tar -xzf ffmpeg-3.4.4.tar.gz \
    && rm ffmpeg-3.4.4.tar.gz \
    && cd ffmpeg-3.4.4 && ./configure --prefix=/usr --libdir=/usr/lib64 --shlibdir=/usr/lib64 --mandir=/usr/share/man --disable-programs --disable-doc --disable-everything --enable-shared --disable-static --enable-ffmpeg --enable-small --enable-avcodec --enable-avformat --enable-avfilter --enable-swresample --enable-swscale --enable-decoder='h264,mjpeg' --enable-encoder='libx264,mjpeg' --enable-parser='h264,mjpeg' --enable-protocol='rtmp,file' --enable-demuxer='rtsp,rtp,image2,image_jpeg_pipe' --enable-muxer='mp4,dash,image2' --enable-filter=scale --extra-cflags='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -march=core2 -fomit-frame-pointer -fPIC' --disable-stripping \
    && make -j2 && make install && cd /build/ && rm -r ffmpeg
