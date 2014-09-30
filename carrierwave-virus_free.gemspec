# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/virus_free/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-virus_free"
  spec.version       = Carrierwave::VirusFree::VERSION
  spec.authors       = ["John Schroeder"]
  spec.email         = ["jschroeder@multiadsolutions.com"]
  spec.summary       = %q{Validate carrierwave uploads are virus free with clamav.}
  spec.description   = %q{Validate carrierwave uploads are virus free with clamav.}
  spec.homepage      = "https://github.com/jschroeder9000/carrierwave-virus_free"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel"
  spec.add_dependency "carrierwave"
  spec.add_dependency "clam_scan"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
