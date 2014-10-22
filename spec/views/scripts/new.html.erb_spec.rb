require 'rails_helper'

RSpec.describe "scripts/new", :type => :view do
  before(:each) do
    assign(:script, Script.new(
      :content => "MyString"
    ))
  end

  it "renders new script form" do
    render

    assert_select "form[action=?][method=?]", scripts_path, "post" do

      assert_select "input#script_content[name=?]", "script[content]"
    end
  end
end
