require 'spec_helper'

describe Interest do
  it { is_expected.to have_many(:attendee_interests)}
  it { is_expected.to have_many(:attendees).through(:attendee_interests)}
end