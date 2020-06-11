require 'rails_helper'
require 'pry'

describe "post routes" do
  before do
    post '/quotes', params: {:author => 'guy', :quote => 'fuck'}
  end

  it "returns author name" do
    expect(JSON.parse(response.body)['author']).to eq('guy')
  end

  it "returns 201 created status " do
    expect(response).to have_http_status(:created)
  end
end