// Generated by CoffeeScript 1.6.3
(function() {
  define(['R'], function(R) {
    return {
      saveSoundCheck: function(isEnabled, fn) {
        var q;
        q = {};
        q[R.key.persistence_sound_check] = isEnabled;
        if (fn == null) {
          fn = function() {};
        }
        return chrome.storage.sync.set(q, fn);
      },
      loadSoundCheck: function(fn) {
        return chrome.storage.sync.get(R.key.persistence_sound_check, function(obj) {
          return fn(obj[R.key.persistence_sound_check]);
        });
      }
    };
  });

}).call(this);
