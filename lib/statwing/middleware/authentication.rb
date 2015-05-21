module Statwing
  class Authentication < Faraday::Middleware
    def add_header(headers)
      key = Base64.encode64(Statwing.configuration.api_key).gsub!("\n", '')
      headers.merge! "Authorization" => "Basic #{key}:"
    end

    def call(env)
      add_header(env[:request_headers])

      @app.call(env)
    end
  end
end
