#!/usr/bin/env bash
#
# File: start_hubot.sh.j2 - A startup script template for Hubot
#

# Start Hubot in the background

. {{ hubot_nvm_dir }}/nvm.sh
nvm use {{ hubot_node_version }}

cd {{ hubot_dir }}
. {{ hubot_identity }}.env

bin/hubot --adapter {{ hubot_adapter }}
