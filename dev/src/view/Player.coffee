
# PLAYER MANAGER

define ['R', 'MessageEmitter', 'Clock'] , (R, MessageEmitter, Clock) ->

	$playBtn = $stopBtn = null

	fnPlayPause = () ->
		$this = $(this);
		if ( $this.hasClass('play'))
			MessageEmitter.start()
			$this.removeClass('play').addClass('pause')
				 .children().removeClass('uk-icon-play').addClass('uk-icon-pause')
		else if ( $this.hasClass('pause'))
			MessageEmitter.pause()
			$this.removeClass('pause').addClass('play')
				 .children().removeClass('uk-icon-pause').addClass('uk-icon-play')

	fnStop = () ->
		MessageEmitter.stop()
		if ( $playBtn.hasClass('pause'))
			$playBtn.removeClass('pause').addClass('play')
				 .children().removeClass('uk-icon-pause').addClass('uk-icon-play')

	$(document).ready ->
		console.log 'init player'
		$playBtn = $('.play').click( fnPlayPause )
		$stopBtn = $('.stop').click( fnStop )

	MessageEmitter.bind (msg) -> Clock.update msg.s # secs