// Generated by CoffeeScript 1.6.3
(function() {
  define([], function() {
    return {
      getSize: function(obj) {
        var count, key;
        console.log(obj);
        count = 0;
        for (key in obj) {
          if (obj.hasOwnProperty(key)) {
            count++;
          }
        }
        return count;
      }
    };
  });

}).call(this);
