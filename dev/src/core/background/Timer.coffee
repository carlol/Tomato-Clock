
# TIMER LISTENERS

# @see http://www.w3schools.com/js/js_timing.asp

define ['R', 'MessageEmitter', '_'] , (R, MessageEmitter, _) ->

	class Timer # public methods

		T = null # timer ctrl
		counter = 0 # n tick executed
		n = 10
		_target = null

		changeIcon = (n) -> # private utility
			chrome.browserAction.setIcon
		        path: if _.isDef(n) then R.path.icon + n + ".jpg" else R.path.default_icon

		# public methods

		init : -> # initialization
			self = @
			chrome.runtime.onMessage.addListener (request, sender, sendResponse) ->
			    self[request.type]?(request, sender, sendResponse)

			chrome.runtime.onConnect.addListener (port) ->
					_target = port
					port.onDisconnect.addListener ->
						_target = null
					  
		start : (req, sender, sendResponse) ->
			if  T? then	return off #EXIT

			console.log R.string.start_timer_msg
			console.log req
			tick = req.time / n

			# init timer ctrl
			T = setInterval ->
				task()
			, tick

			task = () ->
				if ( counter >= n )
					@stop()
					return # exit
				changeIcon( counter )
				counter++
				if _target? then _target.postMessage( {s:counter} )

			return on; # NA


		pause : (req, sender, sendResponse) ->
			if  T?
				window.clearInterval T
				T = null
				console.log R.string.pause_timer_msg


		stop : (req, sender, sendResponse) ->
			if  T?
				window.clearInterval T
				T = null

			counter = 0;
			changeIcon() # set default icon
			console.log R.string.stop_timer_msg
			return on


	new Timer()

