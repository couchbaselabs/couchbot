# Couchbot

![Couchbot](https://github.com/couchbaselabs/couchbot/blob/master/share/couchbot.png?raw=true)

Couchbot is a [Hubot](https://github.com/github/hubot) instance that
specializes in relaxation and helpful behaviors within a group chat setting.

## Activate Couchbot for Development

Follow these directions for a development or testing deployment. Consider
using a different account/name and channel for the development bot as
necessary so as not to collide with the production bot.

You need to install the following on Mac OS X:

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)
* [Ansible](http://www.ansibleworks.com/docs/intro_installation.html)

Next, configure and deploy the bot with these steps:

1. Edit `group_vars/all` and change `hubot_node_version` if necessary.
2. Edit `roles/hubt/vars/main.yml` and change `hubot_identity`, `hubot_admin`,
   and `hubot_dir` values if necessary.
3. Copy `roles/hubot/templates/hubot.env` to `roles/hubot/templates/_hubot.env` and edit the variables within. *Ensure
   that `_hubot.env` is not checked into this repository*.

Finally, from the root of this project, use the following command to
deploy the bot for development and testing:

```
vagrant up
```

