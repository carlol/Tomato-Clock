
# ICON DRAWER

define ['R'], (R) ->

	mkIcon = (n) ->
		canvas = undefined
		ctx = undefined
		red = "#DD4B39"
		green = "#469446"
		steps = R.int.steps
		canvas = document.createElement("canvas")
		ctx = canvas.getContext("2d")
		ctx.clearRect 0, 0, 400, 400
		ctx.scale(0.05, 0.05)

		# donut
		ctx.fillStyle = red
		ctx.beginPath()
		ctx.arc 200, 150, 150, 1.5 * Math.PI, (Math.PI * (1.5 + 2 * ((n) / steps))), false
		ctx.arc 200, 150, 90, (Math.PI * (1.5 + 2 * ((n) / steps))), 1.5 * Math.PI, true
		ctx.fill()
		ctx.closePath()

		# triangle
		ctx.fillStyle = green
		ctx.beginPath()
		ctx.lineTo 200, 80
		ctx.arc 200, 150, 150, 1.37 * Math.PI, Math.PI * 1.63, false
		ctx.fill()
		ctx.closePath()

		ctx.getImageData(0, 0, 19, 19);

	changeIcon : (n) ->
		chrome.browserAction.setIcon
			imageData: mkIcon(n)

	setDefaultIcon : ->
		chrome.browserAction.setIcon
	        path: R.path.default_icon

