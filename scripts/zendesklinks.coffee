# Description:
#   Returns a URL link to Zendesk ticket upon hearing certain ticket keywords
#
# Commands:
#   [ticket|response|review] <#ticket_number>
#

module.exports = (robot) ->
  robot.hear /(ticket|response|review)[^#]*?#\s*(\d+)/i, (msg)->
  	if msg.message.user.name isnt "Zendesk"
      ticketNum = escape(msg.match[2])
      msg.send "https://couchbasesupport.zendesk.com/agent/#/tickets/"+ticketNum+"    "+msg.message.user.name
