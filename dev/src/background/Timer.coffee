
# TIMER LISTENERS

define ['R', '_', 'TagIO', 'AppStateIO', 'NotificationManager'] , (R, _, TagIO, App, NM) ->

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
				port.postMessage 
					type : R.key.resume_timer
					secs : counter

			port.onDisconnect.addListener ->
				_target = null
				  
	start : (req) ->
		return off if T? # EXIT

		secs = req.time / 1000
		tick = secs / n

		# init timer ctrl
		T = setInterval ->
			task()
		, 1000

		task = () =>
			if counter >= secs # time elapsed
				@stop(req)
				_target.postMessage { type : R.key.end_timer } if _target
				TagIO.incr req.tag if req.tag
				App.loadSoundCheck (isEnabled) -> 
					(new Audio(R.path.alarm_sound)).play() if isEnabled
				NM.showNotification()
				return # exit

			changeIcon( counter ) if counter >= tick
			counter++
			if _target? 
				_target.postMessage
					type : R.key.update_timer
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