require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module PetitRexHat
  class Application < Rails::Application
    config.load_defaults 7.0
    config.time_zone = "Europe/Paris"
    config.i18n.default_locale = :fr

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
