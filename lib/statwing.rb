require 'statwing/version'

require 'virtus'
require 'net/http'
require 'json'

require 'statwing/resource'
require 'statwing/dataset'
require 'statwing/user'

module Statwing
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
