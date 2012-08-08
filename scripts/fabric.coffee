## fabric.coffee
#
# Description: Hubot deploys for you!
#
# Commands:
# deploy <> to <> as <user> pw <password>
#
# Author:
# jl23889

{spawn, exec}  = require 'child_process'

module.exports = (robot) ->
  robot.respond /(deploy|fab deploy) ([\w .-]+) (-r|-R|to) (staging|production) (-u|as) (jetty|cmsdeploy) (pw|-p|with password) (.*)/i, (msg) ->
    msg.send "Okay, hold on, I am trying to deploy " + (msg.match[2]) + " to " + msg.match[4]
    command = "cd /Users/pawong/Documents/projects/ign/" + (msg.match[2]) + " && fab deploy -R " + (msg.match[4]) + " -u " + (msg.match[6]) + " -p " + (msg.match[8])
    console.log("command: " + command)
    exec command, (err, stdout, stderr) ->
      if err
        msg.send "Sorry, I couldn't deploy " + msg.match[2] + " to " + msg.match[4] + " because there was an error"
      else
        msg.send "I completed deploying " + msg.match[2] + " to " + msg.match[4] + ", thanks for waiting! Yay!"
