class AttendeeInterest < ActiveRecord::Base
	belongs_to :interest 
	belongs_to :attendee
end
