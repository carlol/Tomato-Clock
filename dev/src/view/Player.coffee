
# PLAYER MANAGER

define ['R', 'Clock'] , (R, Clock) ->

	_target = null
	$playBtn = $stopBtn = null


	_play = ->
		$playBtn.removeClass('play').addClass('pause')
			 .children().removeClass('uk-icon-play')
			 .addClass('uk-icon-pause')

	_pause = ->
		$playBtn.removeClass('pause').addClass('play')
			 .children().removeClass('uk-icon-pause').addClass('uk-icon-play')

	_stop = ->
		_pause() if $playBtn.hasClass('pause')
		Clock.reset()


	fnPlayPause = ->
		if ( $playBtn.hasClass('play'))
			_target.postMessage
				"type" : R.key.start_timer 
				"time" : R.int.default_time
			_play()
				
		else if ( $playBtn.hasClass('pause'))
			_target.postMessage { "type" : R.key.pause_timer }
			_pause()
			

	fnStop = ->
		_target.postMessage { "type" : R.key.stop_timer }
		_stop()
	

	# initialization

	$(document).ready ->
		console.log 'init player'
		_target = chrome.runtime.connect()
		$playBtn = $('.play').click( fnPlayPause )
		$stopBtn = $('.stop').click( fnStop )

		# routing (replace sendMessage with connection)

		_target.onMessage.addListener (req) ->
			switch req.type
				when R.key.resume_timer then Clock.update req.secs; _play(); #dispatch event
				when R.key.update_clock then Clock.update req.secs
				when R.key.end_timer then _stop()