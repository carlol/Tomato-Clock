// Generated by CoffeeScript 1.6.3
(function() {
  define(['R', 'AppStateIO'], function(R, App) {
    var $soundBtn, getText;
    $soundBtn = null;
    getText = function(isEnabled) {
      if (isEnabled) {
        return R.string.disable_sound;
      } else {
        return R.string.enable_sound;
      }
    };
    return {
      init: function() {
        var that;
        that = this;
        return $(document).ready(function() {
          $soundBtn = $('.sound-btn');
          return App.loadSoundCheck(function(isEnabled) {
            $soundBtn.html(getText(isEnabled));
            return $soundBtn.click(function() {
              isEnabled = !isEnabled;
              $(this).html(getText(isEnabled));
              return App.saveSoundCheck(isEnabled);
            });
          });
        });
      }
    };
  });

}).call(this);