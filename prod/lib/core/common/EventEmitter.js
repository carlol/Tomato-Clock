// Generated by CoffeeScript 1.6.3
(function() {
  define([], function() {
    return {
      on: function(name, fn) {
        return document.addEventListener(name, (function(e) {
          return fn(e.detail);
        }), false);
      },
      trigger: function(name, data) {
        var event;
        event = new CustomEvent(name, {
          'detail': data
        });
        return document.dispatchEvent(event);
      }
    };
  });

}).call(this);