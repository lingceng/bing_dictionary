# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bing_dictionary/version'

Gem::Specification.new do |spec|
  spec.name          = "bing_dictionary"
  spec.version       = BingDictionary::VERSION
  spec.authors       = ["lingceng"]
  spec.email         = ["lingceng2008@gmail.com"]

  spec.summary       = %q{Command line dictionary grabing http://cn.bing.com/}
  spec.description   = %q{Command line dictionary grabing http://cn.bing.com/}
  spec.homepage      = "https://github.com/lingceng/bing_dictionary"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = 'dict'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "nokogiri", "~> 1.6"
end
