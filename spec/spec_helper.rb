require "rails"
require "sunspot_mongo"
require "mongo_mapper"
require "mongoid"

# Load support files
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb' ))].each {|f| require f}

# Load shared examples
require "shared_examples"
