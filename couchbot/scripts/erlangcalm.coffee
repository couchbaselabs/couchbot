# Description:
#   Keep Calm and Blame Erlang
#
# Commands:
#   hubot keep calm
#

erlang = "http://i.imgur.com/UWRjm7x.png"

module.exports = (robot) ->
  robot.hear /keep calm/i, (msg)->
    r = Math.random()
    if r <= 0.05
      msg.send erlang

  robot.respond /keep calm/i, (msg) ->
    msg.send erlang
