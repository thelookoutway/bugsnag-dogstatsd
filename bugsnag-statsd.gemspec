# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bugsnag/statsd/version'

Gem::Specification.new do |spec|
  spec.name          = "bugsnag-statsd"
  spec.version       = Bugsnag::Statsd::VERSION
  spec.authors       = ["Tate Johnson"]
  spec.email         = ["tate@tatey.com"]
  spec.summary       = %q{Bugsnag middleware that increments a Datadog flavoured Statsd counter for each exception.}
  spec.description   = %q{Bugsnag middleware that increments a Datadog flavoured Statsd counter for each exception.}
  spec.homepage      = "https://github.com/tatey/bugsnag-statsd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "dogstatsd-ruby", "~> 1.4.1"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
