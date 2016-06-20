shared_examples 'a mongo document' do
  subject { described_class }

  it 'should call Sunspot.setup when searchable is called' do
    expect(Sunspot).to receive(:setup).once.with subject
    subject.searchable
    expect(subject.searchable?).to be_truthy
  end

  it 'should search' do
    options = {}
    expect(Sunspot).to receive(:new_search).once.and_return(double('search', execute: nil))
    subject.solr_search(options)
  end

  it 'should index and retrieve' do
    test_doc = subject.create title: 'So much foo, so little bar.'
    test_doc.index!

    search = subject.solr_search do
      fulltext 'foo'
    end

    expect(search.hits.length).to eql 1
    expect(search.results.first).to eql test_doc
  end

  describe '#reindex' do
    it 'should be able to reindex' do
      expect(subject.solr_search.total).to be_zero
      subject.create(title: 'Test 1')
      subject.create(title: 'Test 2')
      subject.reindex
      expect(subject.solr_search.total).not_to be_zero
      expect(subject.solr_search.total).to eq subject.count
    end

    it 'should be able to reindex the result of an ORM query', if: ENV['MONGOID_VERSION'] do
      expect(subject.solr_search.total).to be_zero
      2.times { subject.create(title: 'to reindex') }
      2.times { subject.create(title: 'not to reindex') }
      subject.where(title: 'to reindex').reindex
      expect(subject.solr_search.total).to eq 2
    end
  end
end
