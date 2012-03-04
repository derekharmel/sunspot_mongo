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

end
