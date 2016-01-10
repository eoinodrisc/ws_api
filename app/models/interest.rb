class Interest < ActiveRecord::Base
	has_many :attendee_interests
	has_many :attendees, through: :attendee_interests
end
