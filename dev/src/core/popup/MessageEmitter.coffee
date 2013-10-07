
# MESSAGE EMITTER (to background)

define ['R'] , (R) ->
	
	start : (cb) ->
		chrome.runtime.sendMessage 
			"type" : R.string.start_timer 
			"time" : R.int.default_time
			, (res) -> cb? cb(res)

	pause : (cb) ->
		chrome.runtime.sendMessage { "type" : R.string.pause_timer }
			, (res) -> cb? cb(res)

	stop : (cb) ->
		chrome.runtime.sendMessage { "type" : R.string.stop_timer }
			, (res) -> cb? cb(res)