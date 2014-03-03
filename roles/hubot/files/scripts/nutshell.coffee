# Description:
#   Display the fictional O'RLY book "Nutshell in a Nutshell"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot nutshell
#
# Notes:
#   Paradoxically insightful
#
# Author:
#   brianshumate

nutshellBook = 'http://i.imgur.com/hkFOVvJ.png'

module.exports = (robot) ->
  robot.hear /.*(nutshell).*/i, (msg) ->
    r = Math.random()
    if r <= 0.10
      msg.send nutshellBook

  robot.respond /nutshell/i, (msg) ->
    msg.send nutshellBook

