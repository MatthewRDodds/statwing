module Resource
  def uri
    @uri ||= self.class::RESOURCE_LOCATION
  end

  def _http
    Net::HTTP.new(uri.host, uri.port).tap do |config|
      config.use_ssl = true
      config.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
  end

  def request
    Net::HTTP::Post.new(uri, {'Content-Type' =>'application/json'}).tap do |config|
      config.basic_auth Statwing.configuration.api_key, ''
      config.body = data.to_json
    end  
  end

  def save!
  	fail 'need api key!' unless Statwing.configuration.api_key

    JSON.parse _http.request(request).body
  end
end