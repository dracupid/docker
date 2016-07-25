FROM ubuntu:xenial

MAINTAINER Zhao Jingchen "dracupid@gmail.com"

ENV TZ 'Asia/Shanghai'
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

COPY sources.list /etc/apt/

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && rm -rf /var/lib/apt/lists/* /usr/share/man/* /usr/share/doc/*
