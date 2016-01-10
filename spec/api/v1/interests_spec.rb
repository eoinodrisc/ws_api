require 'spec_helper'

describe V1::Interests do

  let(:interest) {Fabricate(:interest)}   

  describe "Getting all the interests in the db" do 
    before do
      interest
    end

    it "should be a success" do
      get '/api/v1/interests'
      expect(response).to be_success
    end

    it "should get all interests" do
      get '/api/v1/interests'
      expect(JSON.parse(response.body).length).to eq 1
    end

    it "should be of the correct format" do
      get '/api/v1/interests'
      expect(response).to match_response_schema("interest/index", true)
    end
  end
end