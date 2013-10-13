
# TAG MANAGER

define ['TagIO'] , (TagIO) ->

	_target = null
	$tag = null

	disable = -> $tag.attr('disabled', '')

	enable = -> $tag.removeAttr('disabled')


			

	$(document).ready ->
		$tag = $('.current-tag') # init
		# add eventListener


