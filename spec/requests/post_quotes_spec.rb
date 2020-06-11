require 'rails_helper'
require 'pry'

describe "post routes" do
  before do
    post '/quotes', params: {:author => 'guy', :quote => 'oh darn'}
  end

  it "returns author name" do
    expect(JSON.parse(response.body)['author']).to eq('guy')
  end

  it "returns quote" do
    expect(JSON.parse(response.body)['quote']).to eq('oh darn')
  end

  it "returns 201 created status " do
    expect(response).to have_http_status(:created)
  end
end

describe "post routes error" do 
   before do
    post '/quotes' , params: {:author => nil, :quote => nil}
   end

   it "returns error message when params are not included in request" do
     expect(JSON.parse(response.body)).to eq({"message"=>"Validation failed: Author can't be blank, Quote can't be blank"})
   end

   it "returns status 422 Unprocessable Entity" do
     expect(response).to have_http_status(:unprocessable_entity)
   end
end