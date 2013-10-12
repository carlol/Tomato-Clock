
# CLOCK MANAGER

define [] , ->

	_separator_ = ':'
	$clock = null

	$(document).ready -> $clock = $('.clock')

	normalize = (n) -> if n<10 then '0'.concat n else ''+n

	toString = (secs) ->
		h = Math.floor(((secs % 31536000) % 86400) / 3600);
		m = Math.floor((((secs % 31536000) % 86400) % 3600) / 60);
		s = (((secs % 31536000) % 86400) % 3600) % 60;

		(if h>0 then normalize(h) + _separator_ else '') + # hours
		(normalize(m) + _separator_) + # minutes
		normalize s # seconds

	update : (secs) -> $clock.text toString secs if !!$clock

	reset : -> $clock.text toString 0 if !!$clock

