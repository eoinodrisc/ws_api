module V1
  module Entities
    module Attendee
      class Base < Grape::Entity
        format_with(:iso_timestamp) { |dt| dt.iso8601 }

        expose :id, documentation: { type: "Integer", desc: "Id of Attendee" }
        expose :full_name, documentation: { type: "String", desc: "Full name of the Attendee" }
        expose :title, documentation: { type: "String", desc: "Title of the Attendee" }
        expose :company, documentation: { type: "String", desc: "Company of the Attendee" }
        expose :country, documentation: { type: "String", desc: "Country of the Attendee" }
        expose :interests, with: V1::Entities::Interest::Base, documentation: { desc: "List of the interests of the Attendee" }
      end
    end
  end
end