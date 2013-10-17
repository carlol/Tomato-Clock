
# CONNECTION MANAGER

define ['R', 'EventEmitter'], (R, EE) ->

	port = null

	
	send : -> port.postMessage.apply(port, arguments)

	init : -> $(document).ready ->
		port = chrome.runtime.connect()
		
		# routing (replace sendMessage with connection)
		port.onMessage.addListener (req) ->
			console.log req
			switch req.type
				when R.key.resume_timer then EE.trigger(R.key.resume_timer, req)
				when R.key.update_timer then EE.trigger(R.key.update_timer, req)
				when R.key.end_timer then EE.trigger(R.key.end_timer, req)
