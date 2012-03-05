# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunspot/mongo/version"

Gem::Specification.new do |s|
  s.name        = "sunspot_mongo"
  s.version     = Sunspot::Mongo::VERSION
  s.authors     = ["Brian Alexander"]
  s.email       = ["balexand@gmail.com"]
  s.homepage    = "https://github.com/balexand/sunspot_mongo"
  s.summary     = %q{Sunspot search for both MongoDB. Supports Mongo Mapper and Mongoid.}
  s.description = %q{Sunspot search for both MongoDB. Supports Mongo Mapper and Mongoid.}

  s.rubyforge_project = "sunspot_mongo"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "sunspot_rails", [">= 0"]

  s.add_development_dependency "bson_ext", [">= 0"]
  s.add_development_dependency "mongo_mapper", [">= 0"]
  s.add_development_dependency "mongoid", [">= 0"]
  s.add_development_dependency "rails", [">= 0"]
  s.add_development_dependency "rspec", [">= 0"]
  s.add_development_dependency "guard", [">= 0"]
  s.add_development_dependency "guard-rspec", [">= 0"]
  s.add_development_dependency "sunspot_solr", [">= 0"]
end
