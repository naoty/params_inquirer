# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'params_inquirer/version'

Gem::Specification.new do |gem|
  gem.name          = "params_inquirer"
  gem.version       = ParamsInquirer::VERSION
  gem.authors       = ["Naoto Kaneko"]
  gem.email         = ["naoty.k@gmail.com"]
  gem.description   = %q{ParamsInquirer gives you a prettier way to inquire params value.}
  gem.summary       = %q{ParamsInquirer gives you a prettier way to inquire params value.}
  gem.homepage      = "https://github.com/naoty/params_inquirer"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport'
  gem.add_development_dependency 'rspec'
end
