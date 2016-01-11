module V1
	class API < Grape::API
		prefix 'api'
		format :json
		version 'v1', using: :path

		mount Attendees
		mount Interests

		add_swagger_documentation :format => :json,
															:api_version => 'v1',
															:base_path => "http://localhost:3000",
															:mount_path => "/docs",
															:hide_documentation_path => true
	end
end