require_relative 'boot'

require 'rails/all'
#require "api_constraints"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Notification
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
   
    config.paths.add File.join('app', 'controllers', 'api'), glob: File.join('**', '*.rb')
    #config.autoload_paths += %W(#{Rails.root}/app/api)
    config.autoload_paths += Dir[Rails.root.join('app', 'controllers', 'api' ,'*')]
    
    
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    
    # Grape+JBuilderを使うための設定
    #config.middleware.use(Rack::Config) do |env|
    #  env['api.tilt.root'] = Rails.root.join 'app', 'views', 'api'
    #end
  end
end
