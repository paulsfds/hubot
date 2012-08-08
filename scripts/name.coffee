# name.coffee
#
# What should IGN Hubot's name be? Write it in here!
#
# Commands: 
#	hubot vote for name <name> -- vote for this name
#	hubot show votes -- show the total tally
#
# Author: jl23889

names = {hubot:0,jarvis:0};

module.exports = (robot) ->
	robot.respond /(vote for name )([\w .-]+)/i, (msg) ->
		name = msg.match[2].toLowerCase()
		if name of names
			names[name] = names[name] + 1  
		else
			names[name] = 1

	robot.respond /(show votes)/i, (msg) ->
		output = ""
		for key of names
			val = names[key]
			output = output+"Name: "+key+" Total Votes: "+val+"\n"
		msg.send output