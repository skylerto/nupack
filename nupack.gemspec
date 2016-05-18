# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nupack/version'

Gem::Specification.new do |spec|
  spec.name          = "nupack"
  spec.version       = Nupack::VERSION
  spec.authors       = ["Skyler Layne"]
  spec.email         = ["skylerclayne@gmail.com"]
  spec.summary       = %q{nupack is a price estimator for estimating repacking pricing.}

  spec.homepage      = "https://www.github.com/skylerto/nupack"
  spec.license       = "MIT"

  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
end

