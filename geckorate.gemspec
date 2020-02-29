
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "geckorate/version"

Gem::Specification.new do |spec|
  spec.name          = "geckorate"
  spec.version       = Geckorate::VERSION
  spec.authors       = ["Ahmed Saleh"]
  spec.email         = ["aonemdsaleh@gmail.com"]

  spec.summary       = %q{A dead simple decorator for Ruby}
  spec.description   = %q{A dead simple decorator for Ruby}
  spec.homepage      = "https://github.com/aonemd/geckorate"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
