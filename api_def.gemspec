require_relative './lib/api_def'

Gem::Specification.new do |s|
  s.name        = 'api_def'
  s.version     = ApiDef::VERSION
  s.date        = '2015-07-21'
  s.summary     = "API definition tool"
  s.description = "Ruby DSL based API definition tool."
  s.authors     = ["YANKE Guo"]
  s.email       = 'me@yanke.io'
  s.files         = Dir["lib/**/*.rb"]
  s.executables   = ["api_def"]
  s.require_paths = ["lib"]
  s.homepage      = 'http://rubygems.org/gems/api_def'
  s.license       = 'MIT'

  s.add_runtime_dependency 'thor',  '~> 0.19'
  s.add_runtime_dependency 'jbuilder', '~> 2.3.1'
  s.add_runtime_dependency 'sinatra',  '~> 1.4.6'
end
