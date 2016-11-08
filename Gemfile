source 'http://rubygems.org'
ruby '2.3.1'

def linux_only(require_as)
  RbConfig::CONFIG['host_os'] =~ /linux/ ? require_as : false
end

# Mac OS X
def darwin_only(require_as)
  RbConfig::CONFIG['host_os'] =~ /darwin/ ? require_as : false
end

gem 'rails', '~> 5.0'
gem 'rake'

gem 'mongoid', '~> 6.0'
gem 'mongo_ext'

gem 'bundler'
gem 'json'
gem 'jquery-rails'
gem 'newrelic_rpm'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'byebug'
  gem 'pry'
  gem 'rb-fsevent', require: darwin_only('rb-fsevent')
  gem 'terminal-notifier-guard', require: darwin_only('terminal-notifier-guard')
  gem 'rb-inotify', require: linux_only('rb-inotify')
  gem 'database_cleaner'
  gem 'foreman'
  gem 'sqlite3'
end

group :test do
  gem 'simplecov'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end
