class Attendee < ActiveRecord::Base
	has_many :attendee_interests
	has_many :interests, through: :attendee_interests

	default_scope  { order("importance ASC")}
	scope :by_interest, -> (title) {joins(:interests).where("interests.title = ?", title)}
	scope :without_selected_attendees, -> (attendees) {where.not(id: attendees.map(&:id))}

	def full_name
		"#{first_name} #{last_name}"
	end

	def self.interleave_attendees interest
		interested_attendees = Attendee.by_interest(interest)
		uninterested_attendees = Attendee.without_selected_attendees(interested_attendees)
		uninterested_attendees.zip(interested_attendees).flatten.compact
	end
end
