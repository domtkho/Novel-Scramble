require 'rails_helper'

RSpec.describe "game_threads/new", :type => :view do
  before(:each) do
    assign(:game_thread, GameThread.new(
      :thread_name => "MyString",
      :genre => "MyString"
    ))
  end

  it "renders new game_thread form" do
    render

    assert_select "form[action=?][method=?]", game_threads_path, "post" do

      assert_select "input#game_thread_thread_name[name=?]", "game_thread[thread_name]"

      assert_select "input#game_thread_genre[name=?]", "game_thread[genre]"
    end
  end
end
