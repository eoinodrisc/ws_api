module V1
  class API < Grape::API
    prefix 'api'
    format :json
    version 'v1', using: :path

    mount Attendees
    mount Interests
  end
end