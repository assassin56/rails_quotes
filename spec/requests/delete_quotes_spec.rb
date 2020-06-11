require 'rails_helper'
require 'pry'

describe "delete route" do
  before do
    post '/quotes', params: {:author => 'guy', :quote => 'fuck'}
    quote_id = JSON.parse(response.body)['id']
    delete "/quotes/#{quote_id}"
  end

  it 'deletes a quote' do
    expect(JSON.parse(response.body)).to eq({"message"=>"Quote successfully destroyed"})
  end

  it 'returns status 200 ok when delete is successfull' do
    expect(response).to have_http_status(:ok)
  end
end

describe "delete route error" do
  before do
    delete "/quotes/5000"
  end

  it 'throws an error message if user does not specify quote to delete' do
    expect(JSON.parse(response.body)).to eq({"message"=>"Couldn't find Quote with 'id'=5000"})
  end

  it 'returns status 404 not found when delete is unsuccessfull' do
    expect(response).to have_http_status(:not_found)
  end
end