# Description:
#   Uses a Couchbase-specific script to check if CLA is signed.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_CLA_CHECK_URL: the base URL to the check script
#   HUBOT_CLA_DEFAULT_OWNER: the default github organization to check if not provided (eg. 'couchbase')
#
# Commands:
#   couchbot check cla for <email>
#   couchbot check cla for <PR_NUMBER> in <REPO>
#   couchbot check cla for <PR_NUMBER> in <ORGA>/<REPO>
#   couchbot check cla for <PR_FULL_URL>
#
# Author:
#   Simon Baslé <simon@couchbase.com>

PATTERN_EMAIL = /(?:check )?cla for (.*@.*)/i
PATTERN_PR_URL = /(?:check )?cla for https:\/\/github\.com\/([\w-]+)\/([\w-]+)\/pull\/(\d+)/i
PATTERN_PR_REPO = /(?:check )?cla for (\d+) in ([\w-]+)$/i
PATTERN_PR_OWNER_AND_REPO = /(?:check )?cla for (\d+) in ([\w-]+)\/([\w-]+)/i

evaluateCla = (msg, url, res, typo=false) ->
    res.http(url)
      .get() (err, response, body) ->
          try
            if /not signed/i.test(body) and typo
                res.reply "CLA doesn't appear to be signed for #{msg} :( maybe check the repo name / PR number?"
            else if /not signed/i.test(body) and not typo
                res.reply "CLA isn't signed for #{msg} :("
            else if /signed/i.test(body)
                res.reply "CLA is signed for #{msg} :)"
            else
                res.reply "I'm not sure about the CLA, I'm told that '#{body}'"
          catch error
            res.send "Sorry, couldn't check the CLA (error: #{error})"


module.exports = (robot) ->
    robot.respond PATTERN_EMAIL, (res) ->
        res.message.done = true
        claUser = escape(res.match[1])
        claCheckUrl = process.env.HUBOT_CLA_CHECK_URL
        if !!claCheckUrl
            claMsg = "user #{claUser}"
            claUrl = "#{claCheckUrl}/checkcla?email=#{claUser}"
            evaluateCla(claMsg, claUrl, res)
        else
            res.send "Sorry, someone needs to define HUBOT_CLA_CHECK_URL"
    robot.respond PATTERN_PR_REPO, (res) ->
        res.message.done = true
        claCheckUrl = process.env.HUBOT_CLA_CHECK_URL
        claDefaultOwner = process.env.HUBOT_CLA_DEFAULT_OWNER
        if claCheckUrl? and claDefaultOwner?
            claPR = escape(res.match[1])
            claRepo = res.match[2]
            claMsg = "http://github.com/#{claDefaultOwner}/#{claRepo}/pull/#{claPR}"
            claUrl = "#{claCheckUrl}/checkcla?owner=#{claDefaultOwner}&repo=#{claRepo}&prnum=#{claPR}"
            evaluateCla(claMsg, claUrl, res, true)
        else
            res.send "Sorry, someone needs to define HUBOT_CLA_CHECK_URL and HUBOT_CLA_DEFAULT_OWNER"
    robot.respond PATTERN_PR_OWNER_AND_REPO, (res) ->
        #PR with both OWNER and REPO
        res.message.done = true
        claCheckUrl = process.env.HUBOT_CLA_CHECK_URL
        if claCheckUrl?
            claPR = escape(res.match[1])
            claOwner = escape(res.match[2])
            claRepo = escape(res.match[3])
            claMsg = "http://github.com/#{claOwner}/#{claRepo}/pull/#{claPR}"
            claUrl = "#{claCheckUrl}/checkcla?owner=#{claOwner}&repo=#{claRepo}&prnum=#{claPR}"
            evaluateCla(claMsg, claUrl, res, true)
        else
            res.send "Sorry, someone needs to define HUBOT_CLA_CHECK_URL"
    robot.respond PATTERN_PR_URL, (res) ->
        res.message.done = true
        claCheckUrl = process.env.HUBOT_CLA_CHECK_URL
        if claCheckUrl?
            claOwner = escape(res.match[1])
            claRepo = escape(res.match[2])
            claPR = escape(res.match[3])
            claMsg = "http://github.com/#{claOwner}/#{claRepo}/pull/#{claPR}"
            claUrl = "#{claCheckUrl}/checkcla?owner=#{claOwner}&repo=#{claRepo}&prnum=#{claPR}"
            evaluateCla(claMsg, claUrl, res)
        else
            res.send "Sorry, someone needs to define HUBOT_CLA_CHECK_URL"
    robot.respond /((?:check )?cla$|(?:check )?cla .*)/i, (res) ->
        res.send "Sorry, I don't understand '#{res.match[1]}', cla command are either: 'check cla for EMAIL' or 'check cla for PR_NUMBER in [OWNER/]REPO'"
