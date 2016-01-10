module V1
  module Entities
    module Attendee
      class Show < V1::Entities::Attendee::Base
        format_with(:iso_timestamp) { |dt| dt.iso8601 }

        expose :image_url, documentation: { type: "String", desc: "Image of Attendee" }
      end
    end
  end
end