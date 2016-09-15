FROM java:7

## Install ffmpeg - https://www.assetbank.co.uk/support/documentation/install/ffmpeg-debian-squeeze/ffmpeg-debian-jessie/
#RUN echo deb http://www.deb-multimedia.org jessie main non-free >>/etc/apt/sources.list && \
#    echo deb-src http://www.deb-multimedia.org jessie main non-free >>/etc/apt/sources.list && \
#    apt-get update && apt-get install -y --force-yes deb-multimedia-keyring && \
#    apt-get update && apt-get remove ffmpeg && apt-get install -y build-essential \
#      libmp3lame-dev libvorbis-dev libtheora-dev libspeex-dev yasm pkg-config libfaac-dev libopenjpeg-dev libx264-dev && \
#    mkdir -p ffmpeg/software && \
#    cd ffmpeg/software && \
#    wget http://ffmpeg.org/releases/ffmpeg-2.7.2.tar.bz2 && \
#    cd .. && \
#    mkdir src && \
#    cd src && \
#    tar xvjf ../software/ffmpeg-2.7.2.tar.bz2 && \
#    cd ffmpeg-2.7.2 && \
#    ./configure --enable-gpl \
#      --enable-postproc --enable-swscale --enable-avfilter \
#      --enable-libmp3lame --enable-libvorbis --enable-libtheora \
#      --enable-libx264 --enable-libspeex --enable-shared \
#      --enable-pthreads --enable-libopenjpeg \
#      --enable-libfaac --enable-nonfree && make && make install && \
#    /sbin/ldconfig
#

# The grails setup comes from here - https://github.com/mozart-analytics/grails-docker
# Set Grails version (max version for this Docker image is: 2.5.3).
ENV GRAILS_VERSION 2.3.9

# Install Grails
WORKDIR /usr/lib/jvm
RUN wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH
