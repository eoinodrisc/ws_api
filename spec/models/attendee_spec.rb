require 'spec_helper'

describe Attendee do
	let(:interest) {Fabricate(:interest, title: "Fintech")}
	let(:attendee1) {Fabricate(:attendee)}
	let(:attendee2) {Fabricate(:attendee)}
	let(:attendee3) {Fabricate(:attendee, interests: [interest])}

  describe "#full_name" do
  	it "should return both the first name ans last name in a string" do
	  	expect(attendee1.full_name).to eq "#{attendee1.first_name} #{attendee1.last_name}"
	  end
  end

  context "Scope methods" do
    before do
      interest
      attendee1
      attendee2
      attendee3
    end

    describe "#by_interest scope" do
    	it "should return attendee interested in the interest" do
  	  	expect(Attendee.by_interest("Sports").length).to eq 2
  	  end
    end

    describe "#without_interest scope" do
      it "should return attendee interested in the interest" do
        expect(Attendee.without_interest("Sports").length).to eq 1
      end
    end
  end
end
