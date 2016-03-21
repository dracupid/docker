FROM registry.aliyuncs.com/dracupid/ubuntu

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
ENV CA_CERTIFICATES_JAVA_VERSION 20140324

RUN apt-get update \
    && apt-get install -y openjdk-8-jre-headless \
    && rm -rf /var/lib/apt/lists/*

RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure
