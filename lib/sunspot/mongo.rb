require 'sunspot'
require 'sunspot/rails'

module Sunspot
  module Mongo
    def self.included(base)
      base.class_eval do
        extend Sunspot::Rails::Searchable::ActsAsMethods
        Sunspot::Adapters::DataAccessor.register(DataAccessor, base)
        Sunspot::Adapters::InstanceAdapter.register(InstanceAdapter, base)
      end
    end

    class InstanceAdapter < Sunspot::Adapters::InstanceAdapter
      def id
        @instance.id
      end
    end

    class DataAccessor < Sunspot::Adapters::DataAccessor
      def load(id)
        @clazz.find(id)
      end

      def load_all(ids)
        @clazz.where(:_id.in => ids)
      end
    end
  end
end
