require 'spec_helper'

describe AttendeeInterest do
  it { is_expected.to belong_to(:interest)}
  it { is_expected.to belong_to(:attendee)}
end