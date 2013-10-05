
# INITIALIZATION SCRIPT

require ['config'], ->

	require ['MessageEmitter'] , (MessageEmitter) ->
		console.log MessageEmitter.start
		MessageEmitter.start() 