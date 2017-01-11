require "rails_helper"

RSpec.describe ShortVisitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/short_visits").to route_to("short_visits#index")
    end

    it "routes to #new" do
      expect(:get => "/short_visits/new").to route_to("short_visits#new")
    end

    it "routes to #show" do
      expect(:get => "/short_visits/1").to route_to("short_visits#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/short_visits/1/edit").to route_to("short_visits#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/short_visits").to route_to("short_visits#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/short_visits/1").to route_to("short_visits#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/short_visits/1").to route_to("short_visits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/short_visits/1").to route_to("short_visits#destroy", :id => "1")
    end

  end
end
