module Statwing
	class Parser < Faraday::Response::Middleware
	  def on_complete(env)
	    json = JSON.parse(env[:body], :symbolize_names => true)
	    error = json.delete(:error) || {}

	    # Raise error when request returns an error
	    if error.present?
	    	fail "#{error[:type].classify}: #{error[:message]}"
	    end

	    metadata = json.delete(:metadata) || []
	    env[:body] = { :data => json, :errors => error, :metadata => metadata }
	  end
	end
end