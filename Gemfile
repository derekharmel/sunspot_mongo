source 'https://rubygems.org'

ENV['MONGOID_VERSION'] = '4' unless ENV['MONGOID_VERSION'] || ENV['MONGO_MAPPER_VERSION']

if ENV['MONGOID_VERSION']
  case version = ENV['MONGOID_VERSION'] || '~> 4.0'
  when /4/
    gem 'mongoid', '~> 4.0'
  when /3/
    gem 'mongoid', '~> 3.1'
  else
    gem 'mongoid', version
  end
elsif ENV['MONGO_MAPPER_VERSION']
  version = ENV['MONGO_MAPPER_VERSION'] || '~> 0.13'
  gem 'mongo_mapper', version
end

# Specify your gem's dependencies in sunspot_mongo.gemspec
gemspec
