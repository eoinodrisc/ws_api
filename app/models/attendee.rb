class Attendee < ActiveRecord::Base
	has_many :attendee_interests
	has_many :interests, through: :attendee_interests

	default_scope  { order("importance ASC")}
	scope :by_interest, -> (title) {joins(:interests).where("interests.title = ?", title)}

	def full_name
		"#{first_name} #{last_name}"
	end

	def self.without_interest title
		Rails.cache.fetch("#{title}/without_interest") do
			self.select{|a| !a.interests.pluck(:title).include? title}
		end
	end
end

