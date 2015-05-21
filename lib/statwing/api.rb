ssl_options = { verify: true, verify_mode: OpenSSL::SSL::VERIFY_NONE }

Her::API.setup url: Statwing::API_URL, ssl: ssl_options do |c|
  c.use Statwing::Authentication
  c.use Faraday::Request::UrlEncoded
  c.use Statwing::Parser
  c.use Faraday::Adapter::NetHttp
end
