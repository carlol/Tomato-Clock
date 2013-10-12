
# TAG PERSISTENCE

define ['R'] , (R) ->

	Tag : class
		constructor : (@name, @tomatoes) ->
		toString : -> JSON.stringify(@)

	saveAll : (tagList, fn) ->
		q = {}
		q[R.key.persistence_tag] = JSON.stringify tagList
		chrome.storage.sync.set q, fn

	loadAll : (fn) ->
		chrome.storage.sync.get R.key.persistence_tag, (obj) ->
			return if obj[R.key.category] is undefined # EXIT
			tagList = JSON.parse obj[R.key.category]
			fn?tagList

