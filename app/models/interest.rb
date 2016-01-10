class Interest < ActiveRecord::Base
	has_many :attendee_interests
	belongs_to :attendee
end
