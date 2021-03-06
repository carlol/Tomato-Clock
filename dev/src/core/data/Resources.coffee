
# COMMON CONSTANTS

define
	string : 
		test : "this is a test!"
		start_timer_msg : "::: timer start :::"
		pause_timer_msg : "::: timer pause :::"
		stop_timer_msg : "::: timer stop :::"
		incr_tag_msg : "::: increment complited :::"
		enable_sound : "<b class='red'>Enable</b> sound alarm"
		disable_sound : "<b class='red'>Disable</b> sound alarm"

	int :
		default_time : 25*60*1000 #10*1000
		steps : 25

	path :
		icon : 'images/tomato-products-clock-'
		default_icon : 'images/logo19.png'
		alarm_sound : 'sounds/alarm-clock.mp3'
	
	id : undefined

	key : 
		start_timer : "start"
		pause_timer : "pause"
		stop_timer : "stop"
		update_timer : "clock"
		end_timer : "end"
		resume_timer : "resume"
		persistence_tag : "tag_io"
		persistence_current_tag : "current_tag_io"
		persistence_sound_check : 'sound_check'

		play_clock : "play"
		stop_clock : "stop"