require 'rails_helper'

RSpec.describe "game_threads/edit", :type => :view do
  before(:each) do
    @game_thread = assign(:game_thread, GameThread.create!(
      :thread_name => "MyString",
      :genre => "MyString"
    ))
  end

  it "renders the edit game_thread form" do
    render

    assert_select "form[action=?][method=?]", game_thread_path(@game_thread), "post" do

      assert_select "input#game_thread_thread_name[name=?]", "game_thread[thread_name]"

      assert_select "input#game_thread_genre[name=?]", "game_thread[genre]"
    end
  end
end
