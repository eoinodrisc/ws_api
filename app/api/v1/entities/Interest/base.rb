module V1
  module Entities
    module Interest
      class Base < Grape::Entity
        format_with(:iso_timestamp) { |dt| dt.iso8601 }

        expose :title, documentation: { type: "String", desc: "Title of Interest" }
      end
    end
  end
end