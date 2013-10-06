// Generated by CoffeeScript 1.6.3
(function() {
  define(['R'], function(R) {
    return {
      start: function() {
        return chrome.runtime.sendMessage({
          "type": R.string.start_timer,
          "time": R.int.default_time
        }, function(res) {
          return console.log(res);
        });
      },
      pause: function() {
        return chrome.runtime.sendMessage({
          "type": R.string.pause_timer
        }, function(res) {
          return console.log(res);
        });
      },
      stop: function() {
        return chrome.runtime.sendMessage({
          "type": R.string.stop_timer
        }, function(res) {
          return console.log(res);
        });
      }
    };
  });

}).call(this);
