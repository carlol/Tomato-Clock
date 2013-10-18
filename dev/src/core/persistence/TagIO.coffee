
# TAG PERSISTENCE

define ['R'] , (R) ->

	Tag : class
		constructor : (@name, @tomatoes) ->
		toString : -> JSON.stringify(@)

	saveAll : (tagMap, fn) ->
		q = {}
		q[R.key.persistence_tag] = JSON.stringify tagMap
		if ! fn? then fn = -> # do nothing
		chrome.storage.sync.set q, fn

	loadAll : (fn) ->
		chrome.storage.sync.get R.key.persistence_tag, (obj) ->
			if ! obj[R.key.persistence_tag]
				tagMap = {}
			else 
				tagMap = JSON.parse obj[R.key.persistence_tag]
			fn?tagMap

	incr : (name, fn) ->
		@loadAll (tagMap) =>
			if tagMap[name]? then tagMap[name]++; # increment
			else tagMap[name] = 1 # init
			@saveAll tagMap, fn

	saveCurrent : (name, fn) ->
		q = {}
		q[R.key.persistence_current_tag] = name
		if ! fn? then fn = -> # do nothing
		chrome.storage.sync.set q, fn

	loadCurrent : (fn) ->
		chrome.storage.sync.get R.key.persistence_current_tag, (obj) ->
			return if ! obj[R.key.persistence_current_tag]? # EXIT
			fn obj[R.key.persistence_current_tag]