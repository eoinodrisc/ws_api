RSpec::Matchers.define :match_response_schema do |schema, is_array=false|
  match do |response|
    schema_directory = "#{Dir.pwd}/spec/support/schemas"
    schema_path = "#{schema_directory}/#{schema}.json"
    response_to_test = is_array ? JSON.parse(response.body).first : response.body
    JSON::Validator.validate!(schema_path, response_to_test, strict: true, validate_schema: true)
  end
end