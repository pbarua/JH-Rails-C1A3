class Recipe
	include HTTParty
	
	key_value = ENV[ "FOOD2FORK_KEY" ]
	hostport = ENV[ "FOOD2FORK_SERVER_AND_PORT" ] || "www.food2fork.com"
	base_uri "http://#{hostport}/api"
	default_params key: ENV["FOOD2FORK_KEY"] || "7865bf62a10f9a9b6b75bb79aa179735"
	format :json

	def self.for keyword
		get("/search", query: {q: keyword})["recipes"]
	end
end