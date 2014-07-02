# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid/pinyin/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid-pinyin"
  spec.version       = Mongoid::Pinyin::VERSION
  spec.authors       = ["Kaid"]
  spec.email         = ["kaid@kaid.me"]
  spec.summary       = %q{Extra pinyin fields for mongoid.}
  spec.description   = %q{Extra pinyin fields for mongoid.}
  spec.homepage      = "https://github.com/mindpin/mongoid-pinyin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mongoid", "~> 4.0.0"
  spec.add_dependency "ruby-pinyin", "~> 0.4.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3.0.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
