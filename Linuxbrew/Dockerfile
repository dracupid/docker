FROM registry.aliyuncs.com/dracupid/ubuntu

MAINTAINER Zhao Jingchen "dracupid@gmail.com"

RUN apt-get update \
    && apt-get install --no-install-recommends -y git ruby build-essential uuid-runtime \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m linuxbrew

USER linuxbrew

ENV PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
RUN yes | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
