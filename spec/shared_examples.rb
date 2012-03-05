shared_examples "a mongo document" do

  subject { described_class }

  it "should call Sunspot.setup when searchable is called" do
    Sunspot.should_receive(:setup).once.with subject
    subject.searchable
    subject.searchable?.should be_true
  end

  it "should search" do
    options = {}
    Sunspot.should_receive(:new_search).once.and_return(double("search", :execute => nil))
    subject.solr_search(options)
  end

  it "should index and retrieve" do
    test_doc = subject.create :title => 'So much foo, so little bar.'
    test_doc.index!

    search = subject.solr_search do
      fulltext 'foo'
    end

    search.hits.length.should eql 1
    search.results.first.should eql test_doc
  end

end
