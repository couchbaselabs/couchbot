# Description:
#   Displays a "I Have No Idea What I'm Doing" image
#
# Commands:
#   couchbot no idea
#

noidea = "http://i.imgur.com/hmTeehN.jpg"

module.exports = (robot) ->
  robot.hear /(dunno|I don\'t know|beats me|no idea)/i, (msg)->
    r = Math.random()
    if r <= 0.10
      msg.send noidea

  robot.respond /dunno|I don\'t know|beats me|no idea/i, (msg) ->
    msg.send noidea
