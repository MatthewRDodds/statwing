# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'statwing/version'

Gem::Specification.new do |spec|
  spec.name          = 'statwing'
  spec.version       = Statwing::VERSION
  spec.authors       = ['Matthew Dodds']
  spec.email         = ['matthewrusselldodds@gmail.com']
  spec.summary       = %q{Ruby wrapper for Statwing Api}
  spec.description   = 'Provides easy access to the statwing api for Ruby applications'
  spec.homepage      = 'http://github.com/MatthewRDodds/statwing'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'her', '~> 0.7'
  spec.add_runtime_dependency 'activesupport', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
