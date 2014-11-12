# lotto
#
# Description: generates lottery numbers for you
#
# Commands:
#   hubot lotto - generates a set of lottery numbers 
#
# Author:
# clewis 

module.exports = (robot) ->

    robot.respond /lotto/i, (msg) ->

        lotto msg

lotto = (msg) ->
    
    msg.send "DON'T PANIC!!! Hubot is AWESOME and (almost) never wrong!"
    msg.send "Here are today's National Lottery numbers!"
    msg.send getnums(49,6)
    msg.send "Here are today's EuroMillions numbers!"
    msg.send getnums(50,5)
    msg.send "..and two lucky stars..."
    msg.send getnums(11,2) 

getnums = (range, numreq) ->
    
    result = (0 for [0..numreq-1])
    range = range - 1
    for x in [0..numreq-1]
        test=Math.round(Math.random()*range)+1
        until  checkarray(test,result)
            test=Math.round(Math.random()*range)+1
        result[x]=test
    return result

checkarray = (item, array) ->
    for num in array
        if num is item
            return 0 
    return 1
        
