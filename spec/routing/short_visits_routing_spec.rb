require "rails_helper"

RSpec.describe ShortVisitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/short_visits").to route_to("short_visits#index")
    end

    it "does not route to #new" do
      expect(:get => "/short_visits/new").to_not route_to('short_visits#new')
    end

    it "routes to #show" do
      expect(:get => "/short_visits/1").to route_to("short_visits#show", :id => "1")
    end

    it "does not route to #edit" do
      expect(:get => "/short_visits/1/edit").not_to be_routable
    end

    it "does not route to #create" do
      expect(:post => "/short_visits").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(:put => "/short_visits/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/short_visits/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/short_visits/1").to route_to("short_visits#destroy", :id => "1")
    end

  end
end
