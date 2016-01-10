Fabricator(:attendee) do
	first_name {Faker::Name.first_name}
	last_name {Faker::Name.last_name}
	country {Faker::Address.country}
	title {Faker::Name.title}
	company {Faker::Company.name}
	importance {Faker::Number.number(6)}
	bio {Faker::Hipster.paragraphs(1)}
	thumbnail_url {Faker::Avatar.image}
	image_url {Faker::Avatar.image}
	interests {[Fabricate(:interest)]}
	importance {nil}
end
