source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'bcrypt-ruby'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'paperclip'
gem 'bootstrap-addons-rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
  gem 'annotate'
  gem "nifty-generators"
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'bootstrap-sass'
  gem 'introjs-rails'
end
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
##concurrent server
gem 'unicorn'

gem 'jquery-rails' 

gem 'friendly_id'
gem 'simple_form'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
#adding ckeditor gem
gem 'ckeditor'

# multimedia file upload
gem 'jquery-fileupload-rails'



gem 'omniauth-facebook'

#To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'



group :test, :development do
  gem 'rspec-rails', '2.10.0'
  gem 'guard-rspec', '0.5.5'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
end 

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
end 


group :production do
  gem 'pg'
end


gem "mocha", :group => :test