
# NOTIFICATION MANAGER

define ['Quotes'], (Quotes) ->

	passData = ->
		JSON.stringify Quotes.random()

	showNotification : ->
		notification = webkitNotifications.createHTMLNotification 'notification.html'
		notification.show()
