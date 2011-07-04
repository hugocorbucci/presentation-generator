require File.expand_path('../boot', __FILE__)


require 'mongoid/railtie'
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"


Bundler.require(:default, Rails.env) if defined?(Bundler)

module PresentationGenerator
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/lib)

     config.generators do |g|
      g.orm :mongoid
      g.test_framework :rspec
    end

    config.encoding = "utf-8"

    config.filter_parameters += [:password]
  end
end
