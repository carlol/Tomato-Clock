
# MESSAGE EMITTER (to background)

define ['R'] , (R) ->
	
	start : () ->
		chrome.runtime.sendMessage 
			"type" : R.string.start_timer 
			"time" : R.int.default_time
			, (res) -> console.log res

	stop : () ->
		chrome.runtime.sendMessage { "type" : R.string.stop_timer }, (res) -> 
			console.log res