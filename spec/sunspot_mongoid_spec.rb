require 'spec_helper'

class MongoMapperTestDocument
  include MongoMapper::Document
  key :title, String

  include Sunspot::Mongo
  searchable do
    text :title
  end
end

class MongoidTestDocument
  include Mongoid::Document
  field :title

  include Sunspot::Mongo
  searchable do
    text :title
  end
end

class MongoMapperTestDocumentWithOptions
  include MongoMapper::Document
  key :title, String

  include Sunspot::Mongo
  searchable(:auto_index => false, :auto_remove => false) do
    text :title
  end
end

shared_examples "a mongo document" do
  it "should call Sunspot.setup when searchable is called" do
    Sunspot.should_receive(:setup).once.with(described_class)
    described_class.searchable
  end

  it "should search" do
    options = {}
    Sunspot.should_receive(:new_search).once.and_return(double("search", :execute => nil))
    MongoMapperTestDocument.search(options)
  end
end

describe MongoMapperTestDocument do
  it_behaves_like "a mongo document"
end

describe MongoidTestDocument do
  it_behaves_like "a mongo document"
end

describe "test documents with options" do
  it "should set sunspot_options" do
    MongoidTestDocument.sunspot_options.should == {:include => []}
    MongoMapperTestDocumentWithOptions.sunspot_options.should == {:auto_index=>false, :auto_remove=>false, :include=>[]}
  end
end