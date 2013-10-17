
# TAG MANAGER

define ['R', 'TagIO', 'EventEmitter'] , (R, TagIO, EE) ->

	_target = null
	$tag = null


	disable : -> $tag.attr('disabled', '')

	enable : -> $tag.removeAttr('disabled')

	isDisabled : -> $tag.attr('disabled')?

	getValue : -> $tag.val()

	init : ->
		that = @
		$(document).ready ->
			$tag = $('.current-tag') # init
			# add eventListener
			EE.on R.key.play_clock , -> that.disable(); TagIO.saveCurrent $tag.val()
			EE.on R.key.stop_clock , -> that.enable(); $tag.val ''
			EE.on R.key.end_timer , -> that.enable(); $tag.val ''
			EE.on R.key.resume_timer , -> that.disable(); TagIO.loadCurrent (tag) -> $tag.val tag


