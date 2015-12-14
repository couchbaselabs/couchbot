# DOCKER-VERSION  1.8.3

FROM ubuntu:14.04
MAINTAINER Brian Shumate, brian@couchbase.com

ENV BOTDIR /opt/couchbot
ENV HUBOT_PORT 8073

EXPOSE ${HUBOT_PORT}

RUN apt-get update && \
    apt-get install -y python wget && \
    wget -q -O - https://deb.nodesource.com/setup | sudo bash - && \
    apt-get install -y git build-essential nodejs && \
    rm -rf /var/lib/apt/lists/*

COPY couchbot/bin ${BOTDIR}/bin
COPY couchbot/brain-dump.json ${BOTDIR}/brain-dump.json
COPY couchbot/external-scripts.json ${BOTDIR}
COPY couchbot/hubot-scripts.json ${BOTDIR}/hubot-scripts.json
COPY couchbot/package.json ${BOTDIR}/package.json
COPY couchbot/Procfile ${BOTDIR}/Procfile
COPY couchbot/scripts ${BOTDIR}/scripts

RUN npm install cheerio clark cleverbot-node htmlparser hubot-hipchat \
    hubot-scripts hubot-youtube nodepie soupselect textspark underscore

WORKDIR ${BOTDIR}

RUN npm install

CMD ${BOTDIR}/bin/hubot --adapter hipchat
