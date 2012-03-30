require 'spec_helper'

describe "downloads/new" do
  before(:each) do
    assign(:download, stub_model(Download,
      :name => "MyString",
      :description => "MyString",
      :file => "MyString"
    ).as_new_record)
  end

  it "renders new download form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => downloads_path, :method => "post" do
      assert_select "input#download_name", :name => "download[name]"
      assert_select "input#download_description", :name => "download[description]"
      assert_select "input#download_file", :name => "download[file]"
    end
  end
end
