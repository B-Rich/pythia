# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kreskin/version'

Gem::Specification.new do |spec|
  spec.name          = "kreskin"
  spec.version       = Kreskin::VERSION
  spec.authors       = ["Luis Ignacio", "Walter Reyes"]
  spec.email         = ["cejas@icalialabs.com", "wal@icalialabs.com"]
  spec.description   = %q{A ruby gem to wrap Watson Personality Insights API}
  spec.summary       = %q{Watson Personality Insights Wrapper}
  spec.homepage      = "https://github.com/IcaliaLabs/kreskin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "guard"
end
