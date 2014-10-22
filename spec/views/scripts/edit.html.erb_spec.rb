require 'rails_helper'

RSpec.describe "scripts/edit", :type => :view do
  before(:each) do
    @script = assign(:script, Script.create!(
      :content => "MyString"
    ))
  end

  it "renders the edit script form" do
    render

    assert_select "form[action=?][method=?]", script_path(@script), "post" do

      assert_select "input#script_content[name=?]", "script[content]"
    end
  end
end
