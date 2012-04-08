mongo = require('mongoskin')

generate_mongo_url = (obj) ->
	obj.hostname = obj.hostname or 'localhost'
	obj.port = obj.port or 27017
	obj.db = obj.db or 'test'

	if obj.username and obj.password
		"mongodb://#{obj.username}:#{obj.password}@#{obj.hostname}:#{obj.port}/#{obj.db}"
	else
		"mongodb://#{obj.hostname}:#{obj.port}/#{obj.db}"

db = null

module.exports = 
	init: (config) -> 
		db = mongo.db "#{generate_mongo_url config}?auto_reconnect"
		return
		
	db: -> db