require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) 

module Hack
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # add custom validators path
    config.autoload_paths += %W["#{config.root}/app/validators/"]

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'es-VE'
    
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.to_prepare do
        Devise::SessionsController.layout "crud"
        Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "general" : "crud" }
        Devise::ConfirmationsController.layout "crud"
        Devise::UnlocksController.layout "crud"            
        Devise::PasswordsController.layout "crud"        
    end
  end
end
