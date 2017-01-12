require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it "is creating new session with valid data should create new session" do
    user = create(:user)
    @request.headers["Content-Type"] = 'application/vnd.api+json'
    post :create, params: {
                      "session": {
                        "password": "password",
                        "email": "ach2@asd.com"}}
    expect(response.status).to eq(201)
    jdata = JSON.parse response.body
    refute_equal user.token, jdata['data']['attributes']['token']
  end

  test "Should delete session" do
    user = create(:user)
    delete :destroy, params: { id: user.token }
    expect(response.status).to eq(204)
  end
end