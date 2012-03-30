require 'spec_helper'

describe "downloads/edit" do
  before(:each) do
    @download = assign(:download, stub_model(Download,
      :name => "MyString",
      :description => "MyString",
      :file => "MyString"
    ))
  end

  it "renders the edit download form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => downloads_path(@download), :method => "post" do
      assert_select "input#download_name", :name => "download[name]"
      assert_select "input#download_description", :name => "download[description]"
      assert_select "input#download_file", :name => "download[file]"
    end
  end
end
