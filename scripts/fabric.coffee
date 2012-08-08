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
BASE_DIR = "/Users/pawong/Documents/projects/ign/"

module.exports = (robot) ->
  robot.respond /(deploy|fab deploy) ([\w .-]+) (-r|-R|to) (staging|production) (-u|as) (jetty|cmsdeploy) (pw|-p|with password) (.*)/i, (msg) ->
    msg.send "Okay, hold on, I am trying to deploy " + (msg.match[2]) + " to " + msg.match[4]

    changeDirCmd = "cd " + BASE_DIR + msg.match[2]
    exec changeDirCmd, (err, stdout, stderr) ->
      if err
        # if error, the directory might not exist, so try and create it
        cloneRepoCmd = 'cd ' + BASE_DIR + ' && git clone git@github.com:ign/' + msg.match[2] + '.git -b dev'

        exec cloneRepoCmd, (err, stdout, stderr) ->
          if err
            msg.send "Sorry, I couldn't deploy " + msg.match[2] + " to " + msg.match[4] + " because I wasn't able to check out the code from Github"
          else
            console.log('doing deploy after clone')
            doFabDeploy(msg)
      else
        doCheckoutCode(msg, changeDirCmd)

doFabDeploy = (msg) ->
  fabDeployCmd = 'cd ' + BASE_DIR + msg.match[2] + ' && fab deploy -R ' + msg.match[4] + ' -u ' + msg.match[6] + ' -p ' + msg.match[8]
  console.log('cmd: ' + fabDeployCmd)
  exec fabDeployCmd, (err, stdout, stderr) ->
    if err
      msg.send "Sorry, I couldn't deploy " + msg.match[2] + " to " + msg.match[4] + " because fabric errored out"
    else
      msg.send "I completed deploying " + msg.match[2] + " to " + msg.match[4] + ", thanks for waiting! Yay!"

doCheckoutCode = (msg, changeDirCmd) ->
  checkoutCodeCmd = changeDirCmd + ' && git pull origin dev'

  exec checkoutCodeCmd, (err, stdout, stderr) ->
    if err
      msg.send "Sorry, I couldn't deploy " + msg.match[2] + " to " + msg.match[4] + " because I wasn't able to check out the code from Github"
    else
      doFabDeploy(msg)