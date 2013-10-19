define [] , ->

	getSize : ( obj ) ->
		console.log obj
		count = 0
		for key of obj
			count++ if obj.hasOwnProperty key
		return count
		
