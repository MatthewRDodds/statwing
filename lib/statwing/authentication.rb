module Statwing
	class Authentication < Faraday::Middleware
	  def call(env)
	    username = Base64.encode64(Statwing.configuration.api_key)
	    env[:request_headers]["Authorization"] = "Basic " + Base64.encode64(username + ":")
	    @app.call(env)
	  end
	end
end