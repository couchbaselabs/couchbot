# Description:
#   Display comforting imagery
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot comfort
#
# Notes:
#   :|
#
# Author:
#   Brian Shumate <brian@couchbase.com>

comfortingImagery = 'http://i.imgur.com/EL49ZFn.png'

module.exports = (robot) ->
  robot.hear /.*(comfort).*/i, (msg) ->
    r = Math.random()
    if r <= 0.05
      msg.send comfortingImagery

  robot.respond /comfort/i, (msg) ->
    msg.send comfortingImagery
