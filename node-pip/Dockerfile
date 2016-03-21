FROM registry.aliyuncs.com/dracupid/node

MAINTAINER Zhao Jingchen "dracupid@gmail.com"

WORKDIR /var/www/nodejs
COPY pip.conf /root/.pip/

RUN apt-get update \
    && apt-get install -y --no-install-recommends python-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install setuptools wheel \
    && pip install shortuuid beautifulsoup4 pymongo jieba

CMD npm run start
