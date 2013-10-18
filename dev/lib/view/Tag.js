// Generated by CoffeeScript 1.6.3
(function() {
  define(['R', 'TagIO', 'EventEmitter'], function(R, TagIO, EE) {
    var $tag, $tagList, $tagListHeader, createTableRow, _target;
    _target = null;
    $tag = $tagList = $tagListHeader = null;
    createTableRow = function(tag, tomatoes) {
      return $tagList.append($("<tr><td>" + tag + "</td><td>" + tomatoes + "</td></tr>").click(function() {
        $tag.val(tag);
        return $tagListHeader.click();
      }));
    };
    return {
      disable: function() {
        return $tag.attr('disabled', '');
      },
      enable: function() {
        return $tag.removeAttr('disabled');
      },
      isDisabled: function() {
        return $tag.attr('disabled') != null;
      },
      getValue: function() {
        return $tag.val();
      },
      switchList: function() {
        if ($tagList.children().length > 0) {
          return $tagList.children().remove();
        } else {
          return TagIO.loadAll(function(tagMap) {
            var tag, tomatoes, _results;
            _results = [];
            for (tag in tagMap) {
              tomatoes = tagMap[tag];
              _results.push(createTableRow(tag, tomatoes));
            }
            return _results;
          });
        }
      },
      init: function() {
        var that;
        that = this;
        return $(document).ready(function() {
          $tag = $('.current-tag');
          $tagListHeader = $('.tags').find('caption');
          $tagList = $('.tags').find('tbody');
          $tagListHeader.click(function() {
            return that.switchList();
          });
          EE.on(R.key.play_clock, function() {
            that.disable();
            return TagIO.saveCurrent($tag.val());
          });
          EE.on(R.key.stop_clock, function() {
            that.enable();
            return $tag.val('');
          });
          EE.on(R.key.end_timer, function() {
            that.enable();
            return $tag.val('');
          });
          return EE.on(R.key.resume_timer, function() {
            that.disable();
            return TagIO.loadCurrent(function(tag) {
              return $tag.val(tag);
            });
          });
        });
      }
    };
  });

}).call(this);
