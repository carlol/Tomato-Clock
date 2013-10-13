// Generated by CoffeeScript 1.6.3
(function() {
  define(['R', '_'], function(R, _) {
    var Timer;
    Timer = (function() {
      var T, changeIcon, counter, n, _target;

      function Timer() {}

      T = null;

      counter = 0;

      n = 10;

      _target = null;

      changeIcon = function(n) {
        return chrome.browserAction.setIcon({
          path: _.isDef(n) ? R.path.icon + n + ".jpg" : R.path.default_icon
        });
      };

      Timer.prototype.init = function() {
        var self;
        self = this;
        return chrome.runtime.onConnect.addListener(function(port) {
          _target = port;
          port.onMessage.addListener(function(req) {
            var _name;
            console.log(req);
            return typeof self[_name = req.type] === "function" ? self[_name](req) : void 0;
          });
          if (T != null) {
            port.postMessage({
              type: R.key.resume_timer,
              secs: counter
            });
          }
          return port.onDisconnect.addListener(function() {
            return _target = null;
          });
        });
      };

      Timer.prototype.start = function(req) {
        var secs, task, tick,
          _this = this;
        if (T != null) {
          return false;
        }
        secs = req.time / 1000;
        tick = secs / n;
        T = setInterval(function() {
          return task();
        }, 1000);
        task = function() {
          if (counter >= secs) {
            _this.stop();
            _target.postMessage({
              type: R.key.end_timer
            });
            return;
          }
          if (counter >= tick) {
            changeIcon(counter);
          }
          counter++;
          if (_target != null) {
            return _target.postMessage({
              type: R.key.update_clock,
              secs: counter
            });
          }
        };
        return true;
      };

      Timer.prototype.pause = function(req) {
        if (T != null) {
          window.clearInterval(T);
          return T = null;
        }
      };

      Timer.prototype.stop = function(req) {
        if (T != null) {
          window.clearInterval(T);
          T = null;
        }
        counter = 0;
        changeIcon();
        return true;
      };

      return Timer;

    })();
    return new Timer();
  });

}).call(this);