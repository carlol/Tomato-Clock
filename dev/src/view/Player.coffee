
# PLAYER MANAGER

define ['R', 'MessageEmitter'] , (R, MessageEmitter) ->

	fnPlayPause = () ->
		$this = $(this);
		if ( $this.hasClass('play'))
			MessageEmitter.start()
			$this.removeClass('play').addClass('pause')
		else if ( $this.hasClass('pause'))
			MessageEmitter.pause()
			$this.removeClass('pause').addClass('play')

	fnStop = () ->
		MessageEmitter.stop()

	$(document).ready( ->
		console.log 'init player'
		$playBtn = $('.play').click( fnPlayPause )
		$stopBtn = $('.stop').click( fnStop )
	)