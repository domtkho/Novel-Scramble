require "rails_helper"

RSpec.describe GameThreadsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/game_threads").to route_to("game_threads#index")
    end

    it "routes to #new" do
      expect(:get => "/game_threads/new").to route_to("game_threads#new")
    end

    it "routes to #show" do
      expect(:get => "/game_threads/1").to route_to("game_threads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/game_threads/1/edit").to route_to("game_threads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/game_threads").to route_to("game_threads#create")
    end

    it "routes to #update" do
      expect(:put => "/game_threads/1").to route_to("game_threads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/game_threads/1").to route_to("game_threads#destroy", :id => "1")
    end

  end
end
