
# COMMON CONSTANTS

define
	string : 
		test : "this is a test!"
		start_timer : "start"
		start_timer_msg : "::: timer start :::"
		pause_timer : "pause"
		pause_timer_msg : "::: timer pause :::"
		stop_timer : "stop"
		stop_timer_msg : "::: timer stop :::"

	int :
		default_time : 5000#25*60*1000

	path :
		icon : 'images/tomato-products-clock-'
		default_icon : 'images/tomato-products-clock-' + 0 + ".jpg"
	
	id : undefined

	key : 
		update_clock : "clock"
		end_timer : "end"
		resume_timer : "resume"
		persistence_tag : "tag_io"