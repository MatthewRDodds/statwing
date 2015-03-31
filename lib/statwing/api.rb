Her::API.setup url: Statwing::API_URL do |c|
	# c.use Statwing::Parser

  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::ParseJSON
	c.use Statwing::Authentication
  # # c.use FaradayMiddleware::EncodeJson

  c.use Faraday::Adapter::NetHttp
  # c.ssl[:verify] = true
end