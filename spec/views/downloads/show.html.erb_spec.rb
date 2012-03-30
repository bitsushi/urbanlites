require 'spec_helper'

describe "downloads/show" do
  before(:each) do
    @download = assign(:download, stub_model(Download,
      :name => "Name",
      :description => "Description",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File/)
  end
end
