require 'csv'

CSV.foreach('sample_data.csv', :headers => true, :header_converters => :symbol, :converters => :all) do |row|
	record = row.to_hash
	interest_ids = []
	interests = record[:interests].split(",")

	interests.each do |title|
		title = title.delete("{").delete("}").delete('"')
		interest = Interest.find_or_create_by(title: title)
		interest_ids << interest.id
	end

	record[:interest_ids] = interest_ids
	Attendee.create record.except(:interests)
end
