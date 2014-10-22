require 'rails_helper'

RSpec.describe "game_threads/index", :type => :view do
  before(:each) do
    assign(:game_threads, [
      GameThread.create!(
        :thread_name => "Thread Name",
        :genre => "Genre"
      ),
      GameThread.create!(
        :thread_name => "Thread Name",
        :genre => "Genre"
      )
    ])
  end

  it "renders a list of game_threads" do
    render
    assert_select "tr>td", :text => "Thread Name".to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
  end
end
