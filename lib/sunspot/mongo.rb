require 'sunspot'
require 'sunspot/rails'

module Sunspot
  module Mongo
    def self.included(base)
      base.class_eval do
        extend Sunspot::Mongo::ActsAsMethods
        Sunspot::Adapters::DataAccessor.register(DataAccessor, base)
        Sunspot::Adapters::InstanceAdapter.register(InstanceAdapter, base)
      end
    end

    module ActsAsMethods
      include Sunspot::Rails::Searchable::ActsAsMethods

      def searchable(options = {}, &block)
        super
        extend Sunspot::Mongo::ClassMethods
      end
    end

    module ClassMethods
      #
      # Updates indexes for all documents of a collection when called directly
      # on the model class and immediately commit.
      #
      # When called on a Mongoid criteria, the indexing is scoped only to the
      # documents returned by that criteria.
      #
      # When using MongoMapper, this method will always index the entire
      # collection.
      #
      # This method accepts arbitrary arguments for compatibility, but does
      # not implement any options.
      #
      def solr_index(*)
        scope = respond_to?(:criteria) ? criteria : all
        Sunspot.index! scope.select(&:indexable?)
        Sunspot.commit
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
