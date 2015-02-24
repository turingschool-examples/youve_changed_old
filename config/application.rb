require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YouveChanged
  class Application < Rails::Application
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:              'smtp.mandrillapp.com',
      port:                 '587',
      domain:               'blogger.com',
      user_name:            YOUR_USER_NAME_HERE,
      password:             YOUR_API_KEY_HERE,
      authentication:       'plain',
      enable_starttls_auto: true
    }

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :sidekiq

    config.autoload_paths += %W(
      #{config.root}/app/jobs
    )
  end
end
