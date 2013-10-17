
# COMMON CONSTANTS

define
	string : 
		test : "this is a test!"
		start_timer_msg : "::: timer start :::"
		pause_timer_msg : "::: timer pause :::"
		stop_timer_msg : "::: timer stop :::"
		incr_tag_msg : "::: increment complited :::"

	int :
		default_time : 5000#25*60*1000

	path :
		icon : 'images/tomato-products-clock-'
		default_icon : 'images/tomato-products-clock-' + 0 + ".jpg"
	
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

		play_clock : "play"
		stop_clock : "stop"