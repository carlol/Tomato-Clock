
# TIMER LISTENERS

# @see http://www.w3schools.com/js/js_timing.asp

# timer

define ['R', 'MessageEmitter'] , (R, MessageEmitter) ->

	T = null # timer ctrl

	changeIcon = (n) -> # private utility
		chrome.browserAction.setIcon
	        path: R.path.icon + n + ".jpg"

	Timer = # public methods

		init : -> # initialization
			chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
			    #console.log request
			    Timer[request.type]? (request)

		start : (req) ->
			console.log R.string.start_timer_msg

			n = 10
			counter = 0
			tick = req.time / n

			# init timer ctrl
			T = setInterval ->
				task()
			, tick

			task = () ->
				if ( counter >= 10 ) 
					window.clearInterval T
					console.log R.string.stop_timer_msg
					return; # exit

				#console.log counter
				changeIcon( counter )
				counter++;

			return on; # NA


		stop : (req) ->

			if  T?
				window.clearInterval T
				console.log R.string.stop_timer_msg


