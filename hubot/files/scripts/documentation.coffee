# Description:
#   80s documentation band
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot documentation
#
# Notes:
# (dealwithit)
#
# Author:
#   Brian Shumate <brian@couchbase.com>

Dokken = ['http://www.rockcinema.eu/resources/Dokken001.jpg',
          'http://www.nolifetilmetal.com/images/dokken_logo_BIG.jpg',
          'http://www.tubanda.com.ve/Archivos/Notas/dokken.jpg',
          'http://ecx.images-amazon.com/images/I/61Av9DOGSnL.jpg',
          'http://cascadestudios.com/wp-content/uploads/2013/07/dokkenband.gif']

module.exports = (robot) ->
  robot.hear /documentation/i, (msg)->
    r = Math.random()
    if r <= 0.05
      msg.send msg.random Dokken

  robot.respond /documentation/i, (msg) ->
    msg.send msg.random Dokken
