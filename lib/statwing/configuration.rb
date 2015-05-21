module Statwing
  API_URL = 'https://www.statwing.com/api/p0/'

  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = ''
    end
  end

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
