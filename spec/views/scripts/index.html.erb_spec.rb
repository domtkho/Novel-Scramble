require 'rails_helper'

RSpec.describe "scripts/index", :type => :view do
  before(:each) do
    assign(:scripts, [
      Script.create!(
        :content => "Content"
      ),
      Script.create!(
        :content => "Content"
      )
    ])
  end

  it "renders a list of scripts" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
