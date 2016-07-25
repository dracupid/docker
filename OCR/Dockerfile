FROM registry.aliyuncs.com/dracupid/tomcat

ENV TESSDATA_PREFIX /usr/share/tesseract-ocr

ADD 3.1.0.tar.gz /tmp/
COPY ippicv_linux_20151201.tgz /tmp/opencv-3.1.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/

RUN apt-get update \
    && apt-get install -y build-essential cmake libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev libpng-dev \
    && apt-get install -y libleptonica-dev libtesseract-dev tesseract-ocr-eng tesseract-ocr-chi-sim libmagick++-dev \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp/opencv-3.1.0/ && mkdir build && cd build \
    && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local .. \
    && make -j4 \
    && make install \
    && make clean \
    && rm -rf /tmp/*

#http://docs.opencv.org/3.1.0/d7/d9f/tutorial_linux_install.html
