# Description:
#   Displays BOLTH image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot bolth
#
# Notes:
#   None
#
# Author:
#   Brian Shumate <brian@couchbase.com>

bolthImg = "http://i.imgur.com/VEtSXyl.png"

module.exports = (robot) ->
  robot.hear /bolth/i, (msg)->
    msg.send msg bolthImg
      
  robot.respond /bolth/i, (msg) ->
    msg.send msg bolthImg
