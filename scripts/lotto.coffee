# lotto
#
# Description: generates Mega Millions lottery numbers for you
#
# Commands:
#	hubot lotto - generates a set of lottery numbers 
#
# Author:
# jl23889

luckyNumbers = [Math.round(Math.random()*56), Math.round(Math.random()*56), Math.round(Math.random()*56), Math.round(Math.random()*56), Math.round(Math.random()*56), Math.round(Math.random()*56)]


module.exports = (robot) ->
	robot.respond /lotto/i, (msg) ->
		lotto msg

lotto = (msg) ->
	
	msg.send "Here are today's lucky numbers!"
	msg.send "No worries, Hubot is (almost) never wrong!"
	msg.send luckyNumbers


