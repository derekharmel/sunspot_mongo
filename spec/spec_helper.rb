require "rails"
require "sunspot_mongo"
require "mongo_mapper"
require "mongoid"

# Load support files
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb' ))].each {|f| require f}

# Load shared examples
require "shared_examples"

def setup_servers_and_connections
  FileUtils.mkdir_p '/tmp/sunspot_mongo_test/'

  @solr_pid  = fork { `sunspot-solr start --log-file=/tmp/sunspot_mongo/solr.log --log-level=INFO --port=8900` }
  @mongo_pid = fork { `mongod --fork --port 27900 --logpath=/tmp/sunspot_mongo/mongo.log --dbpath=/tmp/sunspot_mongo/` }
  sleep 5

  connection = Mongo::Connection.new('localhost', 27900)
  database   = connection.db('sunspot_mongo_test')
  database.collections.reject{|col| col.name =~ /^system/}.each &:drop

  Mongoid.database       = database
  MongoMapper.connection = connection
  MongoMapper.database   = 'sunspot_mongo_test'

  Sunspot.config.solr.url = 'http://127.0.0.1:8900/solr'
end
setup_servers_and_connections

RSpec.configure do |config|
  config.before :each do
    Sunspot.remove_all!
  end
end
