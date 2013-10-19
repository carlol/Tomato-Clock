
# APP STATE

define ['R'] , (R) ->

	saveSoundCheck : (isEnabled, fn) ->
		q = {}
		q[R.key.persistence_sound_check] = isEnabled
		if ! fn? then fn = -> # do nothing
		chrome.storage.sync.set q, fn

	loadSoundCheck : (fn) ->
		chrome.storage.sync.get R.key.persistence_sound_check, (obj) ->
			fn obj[R.key.persistence_sound_check]

