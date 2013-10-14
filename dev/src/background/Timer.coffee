
# TIMER LISTENERS

# @see http://www.w3schools.com/js/js_timing.asp

define ['R', '_'] , (R, _) ->

	class Timer # public methods

		T = null # timer ctrl
		counter = 0 # n tick executed
		n = 10
		_target = null

		changeIcon = (n) -> # private utility
			console.log n
			chrome.browserAction.setIcon
		        path: if n? then R.path.icon + n + ".jpg" else R.path.default_icon

		# public methods

		init : -> # initialization

			self = @

			chrome.runtime.onConnect.addListener (port) ->
				_target = port

				port.onMessage.addListener (req) ->
					self[req.type]?(req)

				if T? # if task running
					console.log #test
						type : R.key.resume_timer
						secs : counter
					port.postMessage 
						type : R.key.resume_timer
						secs : counter

				port.onDisconnect.addListener ->
					_target = null
					  
		start : (req) ->
			return off if T? #EXIT

			secs = req.time / 1000
			tick = secs / n

			# init timer ctrl
			T = setInterval ->
				task()
			, 1000

			task = () =>
				if counter >= secs
					@stop()
					_target.postMessage { type : R.key.end_timer } if _target
					return # exit

				changeIcon( counter ) if counter >= tick
				counter++
				if _target? 
					_target.postMessage
						type : R.key.update_clock
						secs : counter

			return on; # NA


		pause : (req) ->
			if  T?
				window.clearInterval T
				T = null


		stop : (req) ->
			if  T?
				window.clearInterval T
				T = null

			counter = 0;
			changeIcon() # set default icon
			return on


	new Timer()

