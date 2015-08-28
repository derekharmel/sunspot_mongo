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
      it 'eager-loads associations specified through :include option' do
        test_doc = MongoidTestDocument.create title: 'So much foo, so little bar.'
        test_tag = MongoidTestDocumentTag.create name: 'A tag'
        test_doc.tags << test_tag
        test_doc.save
        test_doc.index!

        search = MongoidTestDocument.solr_search(include: :tags) do
          fulltext 'foo'
        end
        expect(search.hits.length).to eql 1
        expect(search.results.first).to eql test_doc
        expect(search.results.first.tags).to match [test_tag]
      end
    end
    describe 'test documents with options' do
      it 'should set sunspot_options' do
        expect(MongoidTestDocument.sunspot_options).to eq(include: [])
      end
    end
  end
end
