// Generated by CoffeeScript 1.6.3
(function() {
  define(['Quotes'], function(Quotes) {
    return {
      showNotification: function() {
        var notification;
        notification = webkitNotifications.createHTMLNotification('notification.html');
        return notification.show();
      }
    };
  });

}).call(this);
