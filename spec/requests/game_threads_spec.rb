require 'rails_helper'

RSpec.describe "GameThreads", :type => :request do
  describe "GET /game_threads" do
    it "works! (now write some real specs)" do
      get game_threads_path
      expect(response.status).to be(200)
    end
  end
end
