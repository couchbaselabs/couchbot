# Description:
#   Jira lookup when issues are heard
#
# Dependencies:
#   None
# 
# Configuration:
#   HUBOT_JIRA_LOOKUP_USERNAME
#   HUBOT_JIRA_LOOKUP_PASSWORD
#   HUBOT_JIRA_LOOKUP_URL
#
# Commands:
#   None
#
# Author:
#   Matthew Finlayson <matthew.finlayson@jivesoftware.com> (http://www.jivesoftware.com)
#   Benjamin Sherman  <benjamin@jivesoftware.com> (http://www.jivesoftware.com)

module.exports = (robot) ->
  robot.hear /[a-zA-Z]{2,}-\d+/, (msg) ->
    issue = msg.match[0]
    user = process.env.HUBOT_JIRA_LOOKUP_USERNAME
    pass = process.env.HUBOT_JIRA_LOOKUP_PASSWORD
    url = process.env.HUBOT_JIRA_LOOKUP_URL
    auth = 'Basic ' + new Buffer(user + ':' + pass).toString('base64');
    robot.http("#{url}/rest/api/latest/issue/#{issue}")
      .headers(Authorization: auth, Accept: 'application/json')
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          json_summary = ""
          unless json.fields.summary.nil? or json.fields.summary.empty?
              json_summary = json.fields.summary
          json_description = ""
          unless json.fields.description.nil? or json.fields.description.empty?
              desc_array = json.fields.description.split("\n")
              json_description = ""
              for item in desc_array[0..2]
                  json_description += item
          json_assignee = "[unassigned]"
          unless json.fields.assignee is null or json.fields.assignee.nil? or json.fields.assignee.empty?
              unless json.fields.assignee.name.nil? or json.fields.assignee.name.empty?
                  json_assignee = json.fields.assignee.name
          json_status = ""
          unless json.fields.status is null or json.fields.status.nil? or json.fields.status.empty?
              unless json.fields.status.name.nil? or json.fields.status.name.empty?
                  json_status = json.fields.status.name
          msg.send "Issue:       #{json.key}: #{json_summary}\n Description: #{json_description}\n Assignee:    #{json_assignee}\n Status:      #{json_status}\n Link:        https://www.couchbase.com/issues/browse/#{json.key}\n"
        catch error
          console.log "a URL..."
