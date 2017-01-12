require "rails_helper"

RSpec.describe SessionsController, type: :routing do
  describe "routing" do

    it "does not route to #index" do
      expect(:get => "/sessions").not_to route_to("sessions#index")
    end

    it "does not route to #new" do
      expect(:get => "/sessions/new").not_to be_routable
    end

    it "does not route to #show" do
      expect(:get => "/sessions/1").not_to be_routable
    end

    it "does not route to #edit" do
      expect(:get => "/sessions/1/edit").not_to be_routable
    end

    it "routes to #create" do
      expect(:post => "/sessions").to route_to("sessions#create")
    end

    it "does not route to #update via PUT" do
      expect(:put => "/sessions/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/sessions/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/sessions/1").to route_to("sessions#destroy", :id => "1")
    end

  end
end