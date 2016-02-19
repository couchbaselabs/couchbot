# Couchbot

![Couchbot](https://github.com/couchbaselabs/couchbot/blob/master/share/couchbot.png?raw=true)

Couchbot is a [Hubot](https://github.com/github/hubot) instance that
specializes in relaxation and helpful behaviors within a group 
chat setting.

## Development

This container works fine with `docker-machine` on Mac OS X.

```
docker pull brianshumate/couchbot:dev
git clone git@github.com:couchbaselabs/couchbot.git
$EDITOR _couchbot.env # set proper values for all vars
docker build -t="couchbase/couchbot:dev" ./couchbot/
docker run -p 45678:8073 --env-file _couchbot.env couchbase/couchbot:dev
```

## Production

Running in production:

```
docker pull brianshumate/couchbot:prod
$EDITOR _couchbot.env # set proper values for all vars
docker run -d -p 45678:8073 --env-file _couchbot.env couchbase/couchbot:prod
```

## Tested Software Versions

This project works with the following software versions:

* Docker: 1.8.3
* VirtualBox: 5.0.10
* Hubot: GitHub Master
* Node.js: 0.12.2
