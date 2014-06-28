require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
# require "active_resource/railtie" # Comment this line for Rails 4.0+
require "rails/test_unit/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups) if defined?(Bundler)

module PresentationGenerator
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/lib)
    
    config.generators do |g|
      g.orm :mongoid
      g.test_framework :rspec
    end
    
    config.encoding = 'utf-8'
    config.filter_parameters += [:password]
  end
end
