require 'spec_helper'

describe 'Sunspot::Mongo' do
  it 'has a version' do
    expect(Sunspot::Mongo::VERSION).to_not be_nil
  end

  if ENV['MONGO_MAPPER_VERSION']
    describe MongoMapperTestDocument do
      it_behaves_like 'a mongo document'
    end
    describe 'test documents with options' do
      it 'should set sunspot_options' do
        expect(MongoMapperTestDocumentWithOptions.sunspot_options).to eq(auto_index: false, auto_remove: false, include: [])
      end
    end
  end

  if ENV['MONGOID_VERSION']
    describe MongoidTestDocument do
      it_behaves_like 'a mongo document'
    end
    describe 'test documents with options' do
      it 'should set sunspot_options' do
        expect(MongoidTestDocument.sunspot_options).to eq(include: [])
      end
    end
  end
end
