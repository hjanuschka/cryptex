# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptex/base'

Gem::Specification.new do |spec|
  spec.name          = "cryptex"
  spec.version       = Cryptex::VERSION
  spec.authors       = ["Helmut Januschka"]
  spec.email         = ["helmut@januschka.com"]
  spec.summary       = Cryptex::DESCRIPTION
  spec.description   = Cryptex::VERSION
  spec.homepage      = "https://github.com/hjanuschka/cryptex"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir["lib/**/*"] + %w{ bin/cryptex README.md LICENSE }

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'fastlane_core', '>= 0.39.0', '< 1.0.0' # all shared code and dependencies
  
end
