# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "showfix/version"

Gem::Specification.new do |spec|
  spec.name          = "showfix"
  spec.version       = Showfix::VERSION
  spec.authors       = ["Mitch Dempsey"]
  spec.email         = ["mrdempsey@gmail.com"]
  spec.description   = %q{A gem to easily rename TV show files.}
  spec.summary       = %q{A gem to easily rename TV show files.}
  spec.homepage      = "https://github.com/webdestroya/showfix"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.9.3"

  spec.add_runtime_dependency "bundler", ">= 1.3"
  spec.add_runtime_dependency "thor", ">= 0.18.1"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0.beta1"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
end