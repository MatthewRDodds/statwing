require 'bundler/setup'
Bundler.setup

require 'statwing'

RSpec.configure do |config|
  config.include(Module.new do
    def stub_api_for(klass)
      klass.use_api (api = Her::API.new)

      api.setup url: Statwing::API_URL do |c|
        c.use Statwing::Authentication
        c.use Faraday::Request::UrlEncoded
        c.use Statwing::Parser
        c.use Faraday::Adapter::NetHttp

        c.adapter(:test) { |s| yield(s) }
      end
    end
  end)
end
