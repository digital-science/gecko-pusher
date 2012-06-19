# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gecko-pusher/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Steven Mohapi-Banks"]
  gem.email         = ["steven.mohapibanks@gmail.com"]
  gem.description   = %q{Provides a simple library to send updates to Geckoboard via its push API.}
  gem.summary       = %q{Provides a simple library to send updates to Geckoboard via its push API.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gecko-pusher"
  gem.require_paths = ["lib"]
  gem.version       = Gecko::Pusher::VERSION

  gem.add_dependency "activesupport", "~> 3.2.6"
  gem.add_dependency "httpclient", "~> 2.2.5"
  gem.add_dependency "faraday", "~> 0.8.1"

  gem.add_development_dependency "rspec", "~> 2.10"
  gem.add_development_dependency "webmock", "~> 1.8.7"
  gem.add_development_dependency "guard-rspec", "~> 1.0"
end
