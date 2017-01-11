require "rails_helper"

RSpec.describe "routes to the users controller", :type => :routing do
  it "routes a index route" do
    expect(:get => users_path).
      to route_to(:controller => "users", :action => "index")
  end
  it "routes a index route" do
    expect(:get => users_path).
      to route_to(:controller => "users", :action => "index")
  end
end