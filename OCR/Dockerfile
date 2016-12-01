FROM registry.aliyuncs.com/dracupid/tomcat

ENV TESSDATA_PREFIX /usr/share/tesseract-ocr

ADD 3.1.0.tar.gz /tmp/

RUN apt-get update \
    && apt-get install -y build-essential cmake pkg-config libjpeg-dev \
    && apt-get install -y libleptonica-dev libtesseract-dev tesseract-ocr-eng tesseract-ocr-chi-sim  \
    #libmagick++-dev
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp/opencv-3.1.0/ && mkdir build && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DWITH_FFMPEG=OFF -DWITH_OPENEXR=OFF -DWITH_TIFF=OFF -DWITH_GTK=OFF \
       -DWITH_PNG=OFF -DWITH_MATLAB=OFF -DWITH_WEBP=OFF -DWITH_CUDA=OFF -DBUILD_DOCS=OFF -DBUILD_PERF_TESTS=OFF \
       -DBUILD_TESTS=OFF -DWITH_IPP=OFF -DWITH_LIBV4L=OFF -DCMAKE_INSTALL_PREFIX=/usr/local .. \
    && make -j4 \
    && make install -j4 \
    && make clean \
    && rm -rf /tmp/*

#http://docs.opencv.org/3.1.0/d7/d9f/tutorial_linux_install.html
