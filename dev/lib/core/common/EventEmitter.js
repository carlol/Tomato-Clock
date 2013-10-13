// Generated by CoffeeScript 1.6.3
(function() {
  define([], function() {
    return {
      on: function(name, fn) {
        return document.addEventListener(name, function(e) {
          return typeof fn === "function" ? fn(e, false) : void 0;
        });
      },
      trigger: function(name, data) {
        var event;
        if (data != null) {
          data = {};
        }
        event = new Event(name, data);
        return document.dispatchEvent(event);
      }
    };
  });

}).call(this);
