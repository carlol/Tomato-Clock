
# PLAYER MANAGER

define ['R', 'EventEmitter', 'ConnectionManager', 'Clock'] , (R, EE, CM, Clock) ->

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
			CM.send
				"type" : R.key.start_timer 
				"time" : R.int.default_time
			_play()
				
		else if ( $playBtn.hasClass('pause'))
			CM.send { "type" : R.key.pause_timer }
			_pause()
			

	fnStop = ->
		CM.send { "type" : R.key.stop_timer }
		_stop()
	

	# initialization

	$(document).ready ->
		console.log 'init player'
		$playBtn = $('.play').click( fnPlayPause )
		$stopBtn = $('.stop').click( fnStop )

		EE.on R.key.resume_timer, (req) -> Clock.update req.secs; _play(); console.log req
		EE.on R.key.update_clock, (req) -> Clock.update req.secs
		EE.on R.key.end_timer, (req) -> _stop()
