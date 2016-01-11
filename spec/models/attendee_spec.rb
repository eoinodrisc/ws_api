require 'spec_helper'

describe Attendee do
  it { is_expected.to have_many(:attendee_interests)}
  it { is_expected.to have_many(:interests).through(:attendee_interests)}


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
    	it "should return attendees interested in the interest" do
  	  	expect(Attendee.by_interest("Sports").length).to eq 2
  	  end
    end

    describe "#without_selected_attendees scope" do
      it "should return attendees not inclucing those passed to scope" do
        attendees = [attendee1]
        expect(Attendee.without_selected_attendees(attendees).length).to eq 2
      end
    end
  end
end
