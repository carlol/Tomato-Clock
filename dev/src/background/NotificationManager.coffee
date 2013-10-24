
# NOTIFICATION MANAGER

define ['Quotes'], (Quotes) ->

	isAvaibleNewAPI = ! webkitNotifications.createHTMLNotification?

	showNotification : ->

		if isAvaibleNewAPI

			opt =
				type: "basic"
				title: "Take a Break!"
				message: Quotes.random()
				iconUrl: "images/icon-clock-200x200.png"

			cb = -> console.log 'notification showed'
			
			chrome.notifications.create 'notifications-id', opt, cb
			
		else # old implementation
			notification = webkitNotifications.createHTMLNotification 'notification.html'
			notification.show()
