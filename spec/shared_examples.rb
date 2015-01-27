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
end
