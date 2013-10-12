
# PLAYER MANAGER

define ['R', 'Clock'] , (R, Clock) ->

	port = chrome.runtime.connect()
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
			chrome.runtime.sendMessage 
				"type" : R.string.start_timer 
				"time" : R.int.default_time
			_play()
				
		else if ( $playBtn.hasClass('pause'))
			chrome.runtime.sendMessage { "type" : R.string.pause_timer }
			_pause()
			

	fnStop = ->
		chrome.runtime.sendMessage { "type" : R.string.stop_timer }
		_stop()
	

	# initialization

	$(document).ready ->
		console.log 'init player'
		$playBtn = $('.play').click( fnPlayPause )
		$stopBtn = $('.stop').click( fnStop )

	# routing (replace sendMessage with connection)

	port.onMessage.addListener (msg) -> Clock.update msg.s # secs