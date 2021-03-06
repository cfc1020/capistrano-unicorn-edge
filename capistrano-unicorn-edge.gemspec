# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano-unicorn-edge"
  spec.version       = "0.1.5"
  spec.authors       = ["Alexander Menzhinsky"]
  spec.email         = ["amenzhinsky@gmail.com"]
  spec.summary       = %q{Unicorn support for Capistrano 3.x}
  spec.description   = %q{Unicorn support for Capistrano 3.x, some text to remove warnings}
  spec.homepage      = "https://github.com/amenzhinsky/capistrano-unicorn-edge"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '~> 3.1'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '~> 1.0'
end
