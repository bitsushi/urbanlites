require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :slug => "Slug",
      :name => "Name",
      :who => "Who",
      :where => "Where",
      :what => "What",
      :equipment_used => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Slug/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Who/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Where/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/What/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
