require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "is creating new user" do

    it "is without sending correct content-type should result in error" do
      post :create, params: {}
      expect(response.status).to eq(406)
    end

    it "is with invalid data should result in error" do
      user = create(:user)
      @request.headers["Content-Type"] = 'application/vnd.api+json'
      @request.headers["X-Api-Key"] = user.token
      post :create, params: {
                      "user": {
                        "name": "",
                        "password": "",
                        "email": "",
                        "password_confirmation": "" }}
      expect(response.status).to eq(422)
      jdata = JSON.parse response.body
      pointers = jdata['errors'].collect { |e|
        e['source']['pointer'].split('/').last
      }.sort
      expect(pointers).to include('name','password', 'email', 'password-confirmation')
    end

    it "is with valid data should create new user" do
      user = create(:user)
      @request.headers["Content-Type"] = 'application/vnd.api+json'
      @request.headers["X-Api-Key"] = user.token
      post :create, params: {
                      "user": {
                        "name": "Achal",
                        "password": "password",
                        "email": "ach2@asd.com",
                        "password_confirmation": "password" }}
      expect(response.status).to eq(201)
      jdata = JSON.parse response.body
      expect(jdata['data']['attributes']['name']).to eq('Achal')
                   
    end
  end

  describe "logged in user" do

    before :each do
      @user = create(:user)
      @request.headers["Content-Type"] = 'application/vnd.api+json'
      @request.headers["X-Api-Key"] = @user.token
    end

    it "is valid user data" do
      get :show, params: { id: @user.id }
      assert_response :success
      jdata = JSON.parse response.body
      expect(jdata['data']['id']).to eq(@user.id.to_s)
      expect(jdata['data']['attributes']['name']).to eq(@user.name)
      expect(jdata['data']['attributes']['email']).to eq(@user.email)
      expect(jdata['data']['attributes']['token']).to eq(@user.token)
      
    end

    it "is JSON:API error block when requesting user data with invalid ID" do
      get :show, params: { id: "z" }
      expect(response.status).to eq(401)
    end
  end





end
