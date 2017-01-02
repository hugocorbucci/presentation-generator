source 'https://rubygems.org'
ruby '2.3.1'

def linux_only(require_as)
  RbConfig::CONFIG['host_os'] =~ /linux/ ? require_as : false
end

# Mac OS X
def darwin_only(require_as)
  RbConfig::CONFIG['host_os'] =~ /darwin/ ? require_as : false
end

gem 'bundler'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'json'
gem 'mongo_ext'
gem 'mongoid', '~> 6.0'
gem 'newrelic_rpm'
gem 'rails', '~> 5.0'
gem 'rake'
gem 'sass-rails'
gem 'uglifier'

group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'foreman'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'pry'
  gem 'rb-fsevent', require: darwin_only('rb-fsevent')
  gem 'rb-inotify', require: linux_only('rb-inotify')
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'terminal-notifier-guard', require: darwin_only('terminal-notifier-guard')
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'simplecov'
end
