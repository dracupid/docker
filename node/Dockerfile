FROM registry.aliyuncs.com/dracupid/ubuntu

ENV NODE_VERSION 7.4.0
ENV NODE_HOST http://npm.taobao.org/mirrors/node
ENV NODE_DIR /usr/local
ENV NPM_DIR $NODE_DIR/lib/node_modules/npm
ENV NODE_PROJECT_DIR /var/www/nodejs

COPY .npmrc /root/

RUN curl -SLO "$NODE_HOST/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
    && tar -zxf "node-v$NODE_VERSION-linux-x64.tar.gz" -C $NODE_DIR --strip-components=1 \
    && rm "node-v$NODE_VERSION-linux-x64.tar.gz" \
    && cd $NODE_DIR && rm *.md \
    && cd $NPM_DIR && rm -rf *.md *.bat changelogs man html doc

WORKDIR $NODE_PROJECT_DIR

CMD node
