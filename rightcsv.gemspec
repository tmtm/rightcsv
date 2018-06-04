# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rightcsv"
  spec.version       = '0.2.0'
  spec.licenses      = ['MIT']
  spec.authors       = ["TOMITA Masahiro"]
  spec.email         = ["tommy@tmtm.org"]

  spec.summary       = 'right CSV library'
  spec.description   = 'the CSV library that returns empty string instead of nil.'
  spec.homepage      = 'https://github.com/tmtm/rightcsv'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'csv', '~> 1.0.2'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
