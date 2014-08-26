# Description:
#   Display motivational training related imagery
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot training
#
# Notes:
#   Ell Oh Ell
#
# Author:
#   Brian Shumate <brian@couchbase.com>

trainingMsg = 'http://i.imgur.com/sQWCCGz.png'

module.exports = (robot) ->
  robot.hear /.*(training).*/i, (msg) ->
    r = Math.random()
    if r <= 0.10
      msg.send trainingMsg

  robot.respond /training/i, (msg) ->
    msg.send trainingMsg
