require 'spec_helper'

describe "Sunspot::Mongo" do

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

end
