# Description:
# Nutshell
#
# Commands:
# hubot nutshell - display the fictional O'RLY book "Nutshell in a Nutshell"
# nutshell

nutshellBook = 'http://i.imgur.com/hkFOVvJ.png'

module.exports = (robot) ->
  robot.hear /.*(nutshell).*/i, (msg) ->
    r = Math.random()
    if r <= 0.10
      msg.send nutshellBook

  robot.respond /nutshell/i, (msg) ->
    msg.send nutshellBook

