# Couchbot

![Couchbot](https://github.com/couchbaselabs/couchbot/blob/master/share/couchbot.png?raw=true)

Couchbot is a [Hubot](https://github.com/github/hubot) instance that
specializes in relaxation and helpful behaviors within a group chat setting.

## Couchbot for Development

Follow these directions for a development or testing deployment. Consider
using a different account/name and channel for the development bot as
necessary so as not to collide with the production bot.

You need to install the following on Mac OS X:

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)
* [Ansible](http://www.ansibleworks.com/docs/intro_installation.html)

Next, configure and deploy the bot with three easy steps:

1. Edit `hubot/examples/site.yml` and change the following if necessary:
 * `hubot_admin`
 * `hubot_identity`
 * `hubot_owner`
 * `hubot_description`
2. Copy `roles/hubot/templates/hubot.env` to 
   `roles/hubot/templates/_hubot.env` and edit the variables within. 
   **Ensure that `_hubot.env` is NOT checked into this repository**.
3. Finally, from the root of this project, use the following commands to
deploy the bot for development and testing:

```
cd hubot/examples
vagrant up
```

## Couchbot for Production
 
## Tested Software Versions

This project is known to work with the following software versions:

* Ansible: 1.8.2
* VirtualBox: 4.3.20
* Vagrant: 1.6.5
* Hubot: GitHub Master
* Node.js: 0.10.33
* CentOS/RHEL 6
* Ubuntu: 13.10, 13.04, 12.10, 12.04
