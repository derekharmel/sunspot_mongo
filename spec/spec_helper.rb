require 'rails'
require 'sunspot_mongo'

ROOT_PATH = Pathname(__FILE__).join('../..')
Rails.define_singleton_method(:root) { ROOT_PATH }

if ENV['MONGOID_VERSION']
  require 'mongoid'
  require 'support/models/mongoid'

  Mongoid.connect_to('sunspot_mongo_test')

  case ENV['MONGOID_VERSION']
  when /^3|4/
    Mongoid.default_session.drop
  when /^5/
    Mongo::Logger.level = Logger::INFO
    Mongoid.default_client.database.drop
  end

elsif ENV['MONGO_MAPPER_VERSION']
  require 'mongo_mapper'
  require 'support/models/mongo_mapper'

  connection = Mongo::Connection.new
  database = connection.db('sunspot_mongo_test')
  database.collections.reject { |col| col.name =~ /^system/ }.each(&:drop)
  MongoMapper.connection = connection
  MongoMapper.database = 'sunspot_mongo_test'
end

# Load shared examples
require 'shared_examples'

Sunspot.config.solr.url = 'http://127.0.0.1:8900/solr'

RSpec.configure do |config|
  config.before :each do
    Sunspot.remove_all!
  end
end
