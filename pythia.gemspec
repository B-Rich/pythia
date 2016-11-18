# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'pythia/version'

Gem::Specification.new do |spec|
  spec.name          = "pythia"
  spec.version       = Pythia::VERSION
  spec.authors       = ["Icalia Labs"]
  spec.email         = ["weare@icalialabs.com"]
  spec.description   = %q{This is little bit more than ruby wrapper for Watson Personality Insights by IBM}
  spec.summary       = %q{Watson Personality Insights in Ruby}
  spec.homepage      = "https://github.com/IcaliaLabs/pythia"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "olimpo", "~> 0.1.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 11.3"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
end
