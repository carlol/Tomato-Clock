
# NOTIFICATION MANAGER

define ['Quotes'], (Quotes) ->

	isAvaibleNewAPI = ! webkitNotifications.createHTMLNotification?

	showNotification : ->

		if isAvaibleNewAPI

			data = Quotes.random()

			opt =
				type: "basic"
				title: "Take a Break!"
				message: data.quote # try
				iconUrl: "images/icon-clock-200x200.png"
				items: [{ title: data.author, message: data.quote}] # try

			cb = -> console.log 'notification showed'
			
			chrome.notifications.create 'notifications-id', opt, cb
			
		else # old implementation
			notification = webkitNotifications.createHTMLNotification 'notification.html'
			notification.show()