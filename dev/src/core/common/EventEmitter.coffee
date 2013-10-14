
# EVENT EMITTER

define [], () ->

	on : (name, fn) ->
		document.addEventListener name, ((e) -> fn e.detail), false

	trigger : (name, data) ->
		event = new CustomEvent name, { 'detail' : data }
		document.dispatchEvent event
