# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bugsnag/dogstatsd/version'

Gem::Specification.new do |spec|
  spec.name          = "bugsnag-dogstatsd"
  spec.version       = Bugsnag::DogStatsd::VERSION
  spec.authors       = ["Tate Johnson"]
  spec.email         = ["tate.johnson@fivegoodfriends.com.au"]
  spec.summary       = %q{Bugsnag middleware that increments a Datadog flavoured Statsd counter for each exception.}
  spec.description   = %q{Bugsnag middleware that increments a Datadog flavoured Statsd counter for each exception.}
  spec.homepage      = "https://github.com/fivegoodfriends/bugsnag-dogstatsd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bugsnag", ">= 6.0"
  spec.add_dependency "dogstatsd-ruby", ">= 4.0"
  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
