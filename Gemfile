source 'https://rubygems.org'

gem 'rails', '4.2.5'
gem 'grape'
gem 'thin'
gem 'pg'
gem 'smarter_csv'
gem 'grape-entity', "~> 0.4.0"
gem 'grape-kaminari'
gem 'rack-cors', :require => 'rack/cors'
gem 'grape-swagger', git: "https://github.com/tim-vandecasteele/grape-swagger"

group :development do
	gem 'spring'
  gem 'rails_best_practices'
end

group :test do
  gem 'rspec-rails'
	gem 'faker'
  gem 'shoulda-matchers', "~> 2.8.0"
  gem 'fabrication'
  gem 'json-schema'
  gem 'database_cleaner'
end

group :test, :development do
  gem 'pry'
  gem 'awesome_print'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
