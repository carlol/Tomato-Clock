
# CONNECTION MANAGER

define ['R', 'EventEmitter'], (R, EE) ->

	port = null

	init : ->
		port = chrome.runtime.connect()
		
		# routing (replace sendMessage with connection)
		port.onMessage.addListener (req) ->
			switch req.type
				when R.key.resume_timer then EE.trigger(R.key.resume_time, req)
				when R.key.update_clock then EE.trigger(R.key.update_clock, req)
				when R.key.end_timer then EE.trigger(R.key.end_timer, req)

	send : -> port.postMessage.apply(port, arguments)
