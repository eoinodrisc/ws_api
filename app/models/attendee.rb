class Attendee < ActiveRecord::Base
	has_many :attendee_interests
	has_many :interests, through: :attendee_interests

	accepts_nested_attributes_for :interests

	default_scope  { order("importance ASC")}
	scope :by_interest, -> (title) {joins(:interests).where("interests.title = ?", title)}

	def full_name
		"#{first_name} #{last_name}"
	end

end
