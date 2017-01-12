require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do

describe "users gets"
  it "is get valid list of short_urls" do
    user = create(:user)
    10.times { |n| create(:short_url,  shorty: "abcd"+n.to_s )}
    @request.headers["Content-Type"] = 'application/vnd.api+json'
     @request.headers["X-Api-Key"] = user.token
    get :index, params: { page: { number: 1 } }
    expect(response.status).to eq(200)
    jdata = JSON.parse response.body
    expect(jdata['data'].length).to eq(ShortUrl.per_page)
    expect(jdata['data'][0]['type']).to eq('short-urls')
    expect(jdata['data'].length).to eq(ShortUrl.per_page)
  end

end
