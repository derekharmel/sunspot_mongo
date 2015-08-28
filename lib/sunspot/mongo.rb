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
      attr_accessor :include

      # inspired by how Sunspot does this for ActiveRecord
      def initialize(clazz)
        super(clazz)
        @inherited_attributes = [:include]
      end

      def load(id)
        scope.find(id)
      end

      def load_all(ids)
        scope.find(ids)
      end

      def scope
        sc = @clazz.respond_to?(:criteria) ? @clazz.criteria : @clazz
        @include ? sc.includes(@include) : sc
      end
    end
  end
end
