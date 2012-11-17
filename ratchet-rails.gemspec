# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ratchet/rails/version'

Gem::Specification.new do |gem|
  gem.name          = "ratchet-rails"
  gem.version       = Ratchet::Rails::VERSION
  gem.authors       = ["Toshihiro Morimoto"]
  gem.email         = ["dealforest.net@gmail.com"]
  gem.description   = %q{ratchet-rails project integrates RATCHET for Rails 3.1 Asset Pipeline}
  gem.summary       = %q{RATCHET for Rails 3.1 Asset Pipeline}
  gem.homepage      = "https://github.com/dealforest/ratchet-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency             'railties',   '>= 3.1'
  gem.add_dependency             'actionpack', '>= 3.1'
  gem.add_development_dependency 'rails', '>= 3.1'
end
