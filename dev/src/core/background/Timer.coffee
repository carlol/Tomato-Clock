
# TIMER LISTENERS

# @see http://www.w3schools.com/js/js_timing.asp

# timer

define ['R', 'MessageEmitter'] , (R, MessageEmitter) ->

	T = null # timer ctrl
	counter = 0 # n tick executed

	changeIcon = (n) -> # private utility
		#console.log n
		#console.log n isnt undefined
		chrome.browserAction.setIcon
	        path: R.path.icon + n + ".jpg" # set defaul icon

	Timer = # public methods

		init : -> # initialization
			chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
			    #console.log request
			    Timer[request.type]? (request)

		start : (req) ->
			if  T?
				return off #EXIT

			console.log R.string.start_timer_msg

			n = 10
			tick = req.time / n

			# init timer ctrl
			T = setInterval ->
				task()
			, tick

			task = () ->
				if ( counter >= 10 ) 
					Timer.stop()
					return; # exit

				#console.log counter
				changeIcon( counter )
				counter++;

			return on; # NA


		pause : (req) ->
			if  T?
				window.clearInterval T
				T = null
				console.log R.string.pause_timer_msg


		stop : (req) ->
			if  T?
				window.clearInterval T
				T = null

			counter = 0;
			changeIcon() # set default icon
			console.log R.string.stop_timer_msg
			return on


