# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tubular/version'

Gem::Specification.new do |gem|
  gem.name          = "tubular"
  gem.version       = Tubular::VERSION
  gem.authors       = ["Ryan Closner"]
  gem.email         = ["ryan@ryanclosner.com"]
  gem.description   = %q{Helper to quickly and easily generate HTML tables}
  gem.summary       = %q{Helper to quickly and easily generate HTML tables}
  gem.homepage      = "http://github.com/rclosner/tubular"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
