# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'sunspot/mongo/version'

Gem::Specification.new do |s|
  s.name        = 'sunspot_mongo'
  s.version     = Sunspot::Mongo::VERSION
  s.authors     = ['Brian Alexander', 'Derek Harmel']
  s.email       = ['balexand@gmail.com', 'dgharmel@gmail.com']
  s.homepage    = 'https://github.com/derekharmel/sunspot_mongo'
  s.summary     = 'Sunspot support for Mongo Mapper and Mongoid.'
  s.description = 'Sunspot support for Mongo Mapper and Mongoid.'
  s.license     = 'MIT'

  s.rubyforge_project = 'sunspot_mongo'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'sunspot_rails'

  s.add_development_dependency 'rails'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'sunspot_solr', '2.0.0'
  s.add_development_dependency 'rubocop', '0.33.0'
end
