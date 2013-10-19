
# SOUND CHECK

define ['R', 'AppStateIO'] , (R, App) ->

	$soundBtn = null


	getText = (isEnabled) -> if isEnabled then R.string.disable_sound else R.string.enable_sound


	init : ->
		that = @
		$(document).ready ->
			$soundBtn = $('.sound-btn')

			App.loadSoundCheck (isEnabled) ->
				$soundBtn.html getText isEnabled
				$soundBtn.click ->
					isEnabled = ! isEnabled
					$(@).html getText isEnabled
					App.saveSoundCheck isEnabled