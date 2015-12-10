# Description:
#   The best unicode characters of all time!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot unicode
#
# Notes:
# Ask Brent W. about this
#
# Author:
#   Brian Shumate <brian@couchbase.com>

unicodeOfDoom = '©👫I🏁'

module.exports = (robot) ->
  robot.hear /unicode/i, (msg)->
    r = Math.random()
    if r <= 0.07
      msg.send unicodeOfDoom

  robot.respond /unicode/i, (msg) ->
    msg.send unicodeOfDoom
