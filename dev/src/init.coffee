
# INITIALIZATION SCRIPT

require.config 

	paths: 
		R : 'core/data/Resources'
		Quotes : 'core/data/Quotes'
		_ : 'core/common/Utils'
		EventEmitter : 'core/common/EventEmitter'
		ConnectionManager : 'view/ConnectionManager'
		TagIO : 'core/persistence/TagIO'
		AppStateIO : 'core/persistence/AppStateIO'
		Player : 'view/Player'
		Clock : 'view/Clock'
		Tag : 'view/Tag'
		SoundCheck : 'view/SoundCheck'


require ['Player', 'Tag', 'SoundCheck', 'ConnectionManager'] # ordered components list
		, (components...) -> c.init?() for c in components