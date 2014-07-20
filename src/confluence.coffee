# Description:
#   Hubot script for accessing Confluence
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_CONFLUENCE_URL
#   HUBOT_CONFLUENCE_USER
#   HUBOT_CONFLUENCE_PASSWORD
#   HUBOT_CONFLUENCE_MAX_RESULTS
#
# Commands:
#   hubot find <term> - Searches Confluence for the specified term
#
# Author:
#   TrentScholl

max_results = process.env.HUBOT_CONFLUENCE_MAX_RESULTS || 5

confluence_request = (msg, term, handler) ->
  auth = new Buffer(process.env.HUBOT_CONFLUENCE_USER + ':' + process.env.HUBOT_CONFLUENCE_PASSWORD).toString('base64')

  msg.http(process.env.HUBOT_CONFLUENCE_URL+"/rest/prototype/latest/search?type=page&query=#{term}")
    .headers(Authorization: "Basic #{auth}", Accept: "application/json")
      .get() (err, res, body) ->
        if err
          console.log "Confluence Error :: #{err}"
          return

        content = JSON.parse(body)

        handler content

module.exports = (robot) ->

  robot.respond /find (.*)$/i, (msg) ->
    confluence_request msg, msg.match[1], (results) ->
      n = 0
      for result in results.result when n < max_results
        msg.send result.title + " - " + result.link[0].href
        n++