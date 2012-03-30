require 'spec_helper'

describe "downloads/index" do
  before(:each) do
    assign(:downloads, [
      stub_model(Download,
        :name => "Name",
        :description => "Description",
        :file => "File"
      ),
      stub_model(Download,
        :name => "Name",
        :description => "Description",
        :file => "File"
      )
    ])
  end

  it "renders a list of downloads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
