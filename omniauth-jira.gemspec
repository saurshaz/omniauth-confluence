require "./lib/omniauth-confluence/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-confluence"
  spec.version       = Omniauth::Confluence::VERSION
  spec.authors       = ["Saurabh S"]
  spec.email         = ["saurabh@appler.xyz"]
  spec.summary       = "OmniAuth strategy for Confluence (https://www.atlassian.com/software/confluence)."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/saurshaz/omniauth-confluence"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "omniauth-oauth2"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-utils"
  spec.add_development_dependency "pry-meta"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
end
