# Description:
#   Zoidberg describes a particular robot shape
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   
#
# Notes:
#   various and sundry robot related keywords
#
# Author:
#   Brian Shumate <brian@couchbase.com>

roundRobit = "(zoidberg) ROUND ROBIT"

module.exports = (robot) ->
  robot.hear /(robot|robut|rebot|robit)/i, (msg)->
    r = Math.random()
    if r <= 0.10
      msg.send roundRobit

  robot.respond /(robot|robut|rebot|robit)/i, (msg) ->
    return if fromNick is @name
    msg.send roundRobit

