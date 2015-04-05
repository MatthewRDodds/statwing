module Statwing
	class Authentication < Faraday::Middleware
	  def call(env)
	    key = Base64.encode64(Statwing.configuration.api_key).gsub!("\n", '')
	    env[:request_headers]["Authorization"] = "Basic #{key}:"

	    @app.call(env)
	  end
	end
end