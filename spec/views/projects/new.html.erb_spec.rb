require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :slug => "MyString",
      :name => "MyString",
      :who => "MyString",
      :where => "MyString",
      :what => "MyString",
      :equipment_used => "MyText"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_slug", :name => "project[slug]"
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_who", :name => "project[who]"
      assert_select "input#project_where", :name => "project[where]"
      assert_select "input#project_what", :name => "project[what]"
      assert_select "textarea#project_equipment_used", :name => "project[equipment_used]"
    end
  end
end
