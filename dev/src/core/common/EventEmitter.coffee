
# EVENT EMITTER

define [], () ->

	on : (name, fn) ->
		document.addEventListener name, (e) -> fn?e, false

	trigger : (name, data) ->
		data = {} if data? 
		event = new Event name, data
		document.dispatchEvent event
