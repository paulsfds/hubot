# tableflip
#
# Description: Hubot feels your rage
#
# Commands:
#
# Author:
# jl23889

mood = "happy"

module.exports = (robot) ->
	robot.hear /(fuck|shit|damn|damm|suck)/i, (msg) ->
		mood = "mad"
		msg.send "(╯°□°)╯︵ ┻━┻"
	robot.hear /(sorry hubot|sorry, hubot)/i, (msg) ->
		if mood == "mad"
			msg.send('┬──┬ ノ( ゜-゜ノ)')
			mood = "happy"
