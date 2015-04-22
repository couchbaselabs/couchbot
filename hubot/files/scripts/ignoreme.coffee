# Description:
#   Displays Venture Bros IGNORE ME! image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ignore me
#
# Notes:
#   None
#
# Author:
#   Brian Shumate <brian@couchbase.com>

ignore = [
  "http://3.bp.blogspot.com/-DFLMK7ffcJM/Tbjn752gOFI/AAAAAAAAAsk/qa7D5ZdQDgM/s1600/1301856749331.jpg",
  "http://venturebrosblog.com/wp-content/uploads/2011/02/venture-bros-ignore-me1.jpg",
  "https://s-media-cache-ak0.pinimg.com/originals/40/37/df/4037dfea5a3c205a672a7d57fce6ac21.jpg",

"http://fc08.deviantart.net/fs11/i/2006/228/2/b/IGNORE_ME_by_alucardunit01.jpg",

"http://i35.tinypic.com/e700fl.jpg"

]

module.exports = (robot) ->
  robot.hear /ignore me/i, (msg)->
    r = Math.random()
    if r <= 0.05
      msg.send msg.random ignore
      
  robot.respond /ignore me/i, (msg) ->
    msg.send msg.random ignore
