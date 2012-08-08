# assumetheposition
#
# Description: thank you sir, may i have another?
#
# Commands:
#	assume the position - introduce Hubot to the paddle.
#
# Author:
# jl23889

module.exports = (robot) ->
	robot.hear /assume the position/i, (msg) ->
		lotto msg

lotto = (msg) ->
	
	msg.send "Thank you sir, may I have another?"

