require 'csv'

CSV.foreach('sample_data.csv', :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  record = row.to_hash
  ["{", "}", ' " '].each{|character| record[:interests].delete!(character) }
  interests = record[:interests].split(",")
  interest_ids = interests.collect{|title| Interest.find_or_create_by(title: title).id }
  record[:interest_ids] = interest_ids
  Attendee.create record.except(:interests)
end
