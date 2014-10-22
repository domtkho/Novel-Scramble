require 'rails_helper'

RSpec.describe "scripts/show", :type => :view do
  before(:each) do
    @script = assign(:script, Script.create!(
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
  end
end
