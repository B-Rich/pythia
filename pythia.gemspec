# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'Pythia/version'

Gem::Specification.new do |spec|
  spec.name          = "pythia"
  spec.version       = Pythia::VERSION
  spec.authors       = ["Luis Ignacio"]
  spec.email         = ["cejas@icalialabs.com"]
  spec.description   = %q{Watson Personality Insights in Ruby}
  spec.summary       = %q{Watson Personality Insights in Ruby}
  spec.homepage      = "https://github.com/IcaliaLabs/pythia"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "olimpo", "~> 0.1.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard"
end
