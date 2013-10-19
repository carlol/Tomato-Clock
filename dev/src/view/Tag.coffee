
# TAG MANAGER

define ['R', '_', 'TagIO', 'EventEmitter'] , (R, _, TagIO, EE) ->

	_target = null
	$tag = $tagList = $tagListHeader = null

#<i class="uk-icon-remove-sign"></i>
	createTableRow = (tag, tomatoes) ->
		$tagRow = $("<tr><td>"+tag+"</td><td>"+tomatoes+"</td></tr>")
		$tagRow.find('td')
				.addClass('clickable')
				.click -> $tag.val tag; $tagListHeader.click() #close
		$del = $('<i class="tag-del uk-icon-remove-sign"></i>').click -> 
			$(@).parent().parent().remove(); TagIO.remove tag
			console.log $tagList.children().size()
			$tagListHeader.addClass('hidden') if $tagList.children().size() == 0
		$tagRow.append $('<td class="tag-del-container">').append $del
		$tagList.append $tagRow


	disable : -> $tag.attr('disabled', '')

	enable : -> $tag.removeAttr('disabled')

	isDisabled : -> $tag.attr('disabled')?

	getValue : -> $tag.val()

	switchList : ->
		if $tagList.children().length > 0
			$tagList.children().remove()
		else
			$tagList.addClass('uk-animation-slide-left')
				  	.addClass('hidden')
			TagIO.loadAll (tagMap) ->
				for tag, tomatoes of tagMap
					createTableRow tag, tomatoes
				$tagList.removeClass('hidden')

	init : ->
		that = @
		$(document).ready ->
			$tag = $('.current-tag')
			$tagListHeader = $('.tags-btn')
			TagIO.loadAll (tagMap) -> if _.getSize(tagMap) > 0 then $tagListHeader.removeClass 'hidden'
			$tagList = $('.tags').find('tbody')
			# add eventListener
			$tagListHeader.click -> that.switchList()
			EE.on R.key.play_clock , -> that.disable(); TagIO.saveCurrent $tag.val()
			EE.on R.key.stop_clock , -> that.enable(); $tag.val ''
			EE.on R.key.end_timer , -> that.enable(); $tag.val ''
			EE.on R.key.resume_timer , -> 
				that.disable()
				TagIO.loadCurrent (tag) -> $tag.val tag


