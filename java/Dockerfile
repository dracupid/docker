FROM registry.aliyuncs.com/dracupid/ubuntu

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre

RUN apt-get update \
    && apt-get install -y openjdk-8-jre-headless \
    && rm -rf /var/lib/apt/lists/* \

