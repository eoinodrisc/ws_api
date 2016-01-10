module V1
  module Entities
    module Attendee
      class Index < V1::Entities::Attendee::Base
        format_with(:iso_timestamp) { |dt| dt.iso8601 }

        expose :thumbnail_url, documentation: { type: "String", desc: "Thumbnail picture of Attendee" }
      end
    end
  end
end