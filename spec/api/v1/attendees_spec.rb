require 'spec_helper'

describe V1::Attendees do

  let(:fintech) {Fabricate(:interest, title: "Fintech")}
  let(:film) {Fabricate(:interest, title: "Film")}
  let(:fashion) {Fabricate(:interest, title: "Fashion")}

  let(:attendee) {Fabricate(:attendee, importance: 1)}  
  let(:attendee1) {Fabricate(:attendee, importance: 2, interests: [film])}
  let(:attendee2) {Fabricate(:attendee, importance: 3, interests: [fintech])}
  let(:attendee3) {Fabricate(:attendee, importance: 4, interests: [fintech])} 
  let(:attendee4) {Fabricate(:attendee, importance: 5)}  

  describe "Get Interests" do 
    before do
      attendee
    end

    it "succeeds" do
      get '/api/v1/attendees', interest: "Importance"
      expect(response).to be_success
    end

    it "should be of the correct format" do
      get '/api/v1/attendees', interest: "Importance"
      expect(response).to match_response_schema('attendee/index', true)
    end

    context "should return an interleved result of important attendees and attndees sorted by interest in order of importance" do
      before do
        film
        fashion
      end

      it "succeeds" do
        get '/api/v1/attendees', interest: fintech.title
        expect(response).to be_success
      end

      it "should return all both attendees" do
        get '/api/v1/attendees', interest: fintech.title
        expect(JSON.parse(response.body).length).to eq 2
      end
    end
  end

  describe "Show Interest" do 
    it "succeeds" do
      get "/api/v1/attendees/#{attendee.id}", id: attendee.id
      expect(response).to be_success
    end

    it "should be of the correct format" do
      get "/api/v1/attendees/#{attendee.id}"
      expect(response).to match_response_schema('attendee/show')
    end
  end
end