module RequestHelper
	def request_content(request, parameter)
		@path = ENVIRONMENT['PATH']['api_path']
		@url = "#{@path}#{request}?#{parameter}"
		@last_response = ServiceApi.get(@url)
	end
	def response_code(responseCode)
		@last_response.code.to_s.should == responseCode
		@last_response.bad_gateway? != "false"
  		@last_response.success? == "true"
	end
	def request_debug_url
		puts @url
	end
end
World(RequestHelper)
