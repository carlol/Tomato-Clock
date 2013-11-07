
# INITIALIZATION BACKGROUND SCRIPT
require.config 

	paths: 
		R : 'core/data/Resources'
		Quotes : 'core/data/Quotes'
		_ : 'core/common/Utils'
		EventEmitter : 'core/common/EventEmitter'
		ConnectionManager : 'view/ConnectionManager'
		TagIO : 'core/persistence/TagIO'
		AppStateIO : 'core/persistence/AppStateIO'
		Timer : 'background/Timer'
		NotificationManager: 'background/NotificationManager'
		IconDrawer : 'background/IconDrawer'

require ['NotificationManager', 'Timer'] 
	, (components...) -> console.log c; c.init?() for c in components
		
