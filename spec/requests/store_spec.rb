require 'spec_helper'

describe "Store" do
  subject {page}

  describe "GET /store" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get store_path
      response.status.should be(200)
    end
  end
  describe "Page elements" do
    before {visit store_path}
    it { should have_title('Pragprog Books Online Store') }
    # it { should have_selector('#columns #side a', minimum: 4) }
  end
end