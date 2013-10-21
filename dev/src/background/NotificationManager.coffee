
# NOTIFICATION MANAGER

define ['Quotes'], (Quotes) ->

	showNotification : ->
		notification = webkitNotifications.createHTMLNotification 'notification.html'
		notification.show()
