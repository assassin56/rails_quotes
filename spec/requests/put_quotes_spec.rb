require 'rails_helper'
require 'pry'

describe "put route" do
  before do
    post '/quotes', params: {:author => 'guy', :quote => 'fuck'}
    quote_id = JSON.parse(response.body)['id']
    put "/quotes/#{quote_id}", params: {:author => 'ryan', :quote => 'i need a beer'}
  end

  it 'updates a quote with new author and new quote' do
    expect(JSON.parse(response.body)).to eq({"message"=>"Updated Successfully"})
  end

  it 'returns status 200 ok when update is succesfull' do
    expect(response).to have_http_status(:ok)
  end
end
