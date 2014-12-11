source 'http://rubygems.org'
ruby '1.9.3'

gem 'rails', '4.1.8'
gem 'rake'

gem 'mongoid', "~> 4.0"
gem 'mongo_ext'

gem 'bundler'
gem 'json'
gem 'jquery-rails'
gem 'newrelic_rpm'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

group :development, :test do
 gem 'rspec'
 gem 'rspec-rails'
 gem 'rspec-collection_matchers'
 gem 'guard'
 gem 'guard-rspec'
 gem 'debugger'
 gem 'pry'
 gem 'rb-fsevent' if `uname` =~ /Darwin/
 gem 'terminal-notifier-guard' if `uname` =~ /Darwin/
 gem 'libnotify' if `uname` =~ /Linux/
 gem 'database_cleaner'
 gem 'mongoid-rspec', '2.0.0.rc1'
 gem 'foreman'
 gem 'sqlite3'
end

group :test do
 gem 'codeclimate-test-reporter', require: nil
end
