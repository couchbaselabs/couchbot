# Couchbot

![Couchbot](https://github.com/couchbaselabs/couchbot/blob/master/share/couchbot.png?raw=true)

Couchbot is a [Hubot](https://github.com/github/hubot) instance that
specializes in relaxation and helpful behaviors within a group chat setting.

## Development

This container works fine with `docker-machine` on Mac OS X.

```
docker pull brianshumate/hubot
git clone git@github.com:couchbaselabs/couchbot.git
$EDITOR ./couchbot/Dockerfile # Set proper values for all applicable ENVs
docker build -t="couchbase/hubot:dev" ./couchbot/
docker run -d -p 45678:8080 couchbase/hubot:dev
```

## Production

Running in production:

```
docker pull brianshumate/hubot
git clone git@github.com:couchbaselabs/couchbot.git
$EDITOR ./couchbot/Dockerfile # Set proper values for all applicable ENVs
docker build -t="couchbase/hubot:prod" ./couchbot/
docker run -d -p 45678:8080 couchbase/hubot:prod
```

## Tested Software Versions

This project works with the following software versions:

* Docker: 1.8.3
* VirtualBox: 4.3.30
* Hubot: GitHub Master
* Node.js: 4.2.2
