
# NOTIFICATION MANAGER

define [], () ->

	showNotification : ->
		notification = webkitNotifications.createHTMLNotification 'notification.html'
		notification.show()
