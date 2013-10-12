// Generated by CoffeeScript 1.6.3
(function() {
  define(['R', 'MessageEmitter', 'Clock'], function(R, MessageEmitter, Clock) {
    var $playBtn, $stopBtn, fnPlayPause, fnStop;
    $playBtn = $stopBtn = null;
    fnPlayPause = function() {
      var $this;
      $this = $(this);
      if ($this.hasClass('play')) {
        MessageEmitter.start();
        return $this.removeClass('play').addClass('pause').children().removeClass('uk-icon-play').addClass('uk-icon-pause');
      } else if ($this.hasClass('pause')) {
        MessageEmitter.pause();
        return $this.removeClass('pause').addClass('play').children().removeClass('uk-icon-pause').addClass('uk-icon-play');
      }
    };
    fnStop = function() {
      MessageEmitter.stop();
      if ($playBtn.hasClass('pause')) {
        return $playBtn.removeClass('pause').addClass('play').children().removeClass('uk-icon-pause').addClass('uk-icon-play');
      }
    };
    $(document).ready(function() {
      console.log('init player');
      $playBtn = $('.play').click(fnPlayPause);
      return $stopBtn = $('.stop').click(fnStop);
    });
    return MessageEmitter.bind(function(msg) {
      return Clock.update(msg.s);
    });
  });

}).call(this);
