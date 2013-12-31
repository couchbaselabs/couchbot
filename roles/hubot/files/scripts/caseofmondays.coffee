# Description:
#   Looks like someone has a case of the Mondays
#
# Commands:
#   couchbot case of the mondays
#

mondays = [
  "http://i.imgur.com/8n4hlQE.jpg"
]

module.exports = (robot) ->
  robot.hear /case of the mondays/i, (msg)->
    msg.send msg.random mondays

