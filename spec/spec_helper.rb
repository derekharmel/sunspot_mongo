require 'rails'
require 'sunspot_mongo'
require 'support/rails'

ENV['MONGOID_VERSION'] = '4' unless ENV['MONGOID_VERSION'] || ENV['MONGO_MAPPER_VERSION']

if ENV['MONGOID_VERSION']
  require 'mongoid'
  require 'support/models/mongoid'
elsif ENV['MONGO_MAPPER_VERSION']
  require 'mongo_mapper'
  require 'support/models/mongo_mapper'
end

# Load shared examples
require 'shared_examples'

def setup_servers_and_connections
  FileUtils.mkdir_p '/tmp/sunspot_mongo_test/'

  @solr_pid = fork { `sunspot-solr start --log-file=solr.log --data-directory=data --log-level=INFO --port=8900` }
  sleep 5

  if ENV['MONGOID_VERSION']
    Mongoid.configure do |config|
      config.connect_to('sunspot_mongo_test')
    end
  elsif ENV['MONGO_MAPPER_VERSION']
    connection = Mongo::Connection.new
    database = connection.db('sunspot_mongo_test')
    database.collections.reject { |col| col.name =~ /^system/ }.each(&:drop)
    MongoMapper.connection = connection
    MongoMapper.database   = 'sunspot_mongo_test'
  end

  Sunspot.config.solr.url = 'http://127.0.0.1:8900/solr'
end
setup_servers_and_connections

RSpec.configure do |config|
  config.before :each do
    Sunspot.remove_all!
  end
end
