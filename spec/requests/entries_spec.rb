require 'spec_helper'

describe "Entries" do
  let(:collection) { Collection.create(name: "Collection") }
  describe "GET /entries" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get collection_entries_path(collection)
      response.status.should be(200)
    end
  end
end
