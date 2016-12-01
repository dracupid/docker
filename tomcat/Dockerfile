FROM registry.aliyuncs.com/dracupid/java

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.8
ENV TOMCAT_TGZ_URL http://mirrors.aliyun.com/apache/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
    && tar -zxf tomcat.tar.gz --strip-components=1 \
    && rm -rf bin/*.bat webapps/* tomcat.tar.gz*

EXPOSE 8080
CMD catalina.sh start && tail -f $CATALINA_HOME/logs/catalina.out
