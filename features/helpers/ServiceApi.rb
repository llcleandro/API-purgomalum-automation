class ServiceApi
	include HTTParty
	base_uri ENVIRONMENT['PATH']['api_path']
	format :json
	headers 'Content-Type' => 'application/json'
end