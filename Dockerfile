FROM pierexmachina/node:latest

LABEL description="hexo based on nodejs based on alpine" \
      tags="latest" \
      maintainer="pierexmachina <https://github.com/pierexmachina>" \
      build_ver="2018011901"

ENV UID=1010 \
    GID=1010

# install hexo
RUN npm install hexo-cli -g

# init
WORKDIR _init
RUN hexo init && npm install

# create data volume
VOLUME /blog
WORKDIR /blog

# hexo default port
EXPOSE 4000

# set entrypoint
COPY entrypoint.sh /root/
RUN chmod +x /root/entrypoint.sh

# run hexo server
ENTRYPOINT ["/root/entrypoint.sh"]
