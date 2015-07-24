# Description:
#   Le Sigh
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot le sigh
#
# Notes:
#
# Author:
#   Brian Shumate <brian@couchbase.com>

module.exports = (robot) ->
  robot.hear /le sigh/i, (msg)->
    msg.send 'le sigh'
    msg.send 's/sigh/siigh'
    msg.send 's/siigh/siiigh'
    msg.send 's/siiigh/siiiigh'
    msg.send 's/siiiigh/siiiiigh'
    msg.send 's/siiiiigh/siiiiiigh'
    msg.send 's/siiiiiigh/siiiiiiigh'

  robot.respond /le sigh/i, (msg) ->
    msg.send 'le sigh'
    msg.send 's/sigh/siigh'
    msg.send 's/siigh/siiigh'
    msg.send 's/siiigh/siiiigh'
    msg.send 's/siiiigh/siiiiigh'
    msg.send 's/siiiiigh/siiiiiigh'
    msg.send 's/siiiiiigh/siiiiiiigh'
