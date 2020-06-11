require 'rails_helper'
require 'pry'

describe "get all quotes route", :type => :request do
  let!(:quotes) { FactoryBot.create_list(:quote, 20)}

  before { get '/quotes' }

  it 'returns all quotes' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it "returns status ok" do
    expect(response).to have_http_status(:ok)
  end

end

describe "error messages", :type => :request do
  before { get '/quotes/23'}

  it "returns an error message for an unidentifiable quote" do
    expect(JSON.parse(response.body)).to eq({"message"=>"Couldn't find Quote with 'id'=23"})
  end

  it "returns status 404 not found" do
    expect(response).to have_http_status(:not_found)
  end

  # it 'returns an error message for invalid quote entry' do
  #   expect(JSON.parse(response.body)).to eq({})
  # end
end

describe "get quotes by id route", :type => :request do
 
  before do
    post '/quotes', params: {:author => 'guy', :quote => 'fuck'}
    get '/quotes', params: {:author => 'guy', :quote => 'fuck'}
  end
    
  it "returns a quote" do
    response_to = Quote.last
    expect(response_to.quote).to eq('fuck')
  end

  it "returns 200 ok status " do
    response_to = Quote.last
    expect(response).to have_http_status(:ok)
  end
end
