# IPL
#
# Description: Hubot loves IPL
#
# Commands:
#
# Author:
# jl23889

module.exports = (robot) ->
	robot.hear /IPL/i, (msg) ->
		msg.send "IPL IS FUCKING AWESOME!"

