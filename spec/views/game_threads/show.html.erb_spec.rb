require 'rails_helper'

RSpec.describe "game_threads/show", :type => :view do
  before(:each) do
    @game_thread = assign(:game_thread, GameThread.create!(
      :thread_name => "Thread Name",
      :genre => "Genre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Thread Name/)
    expect(rendered).to match(/Genre/)
  end
end
