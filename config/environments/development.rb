Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true
  config.cache_store = :dalli_store

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # config.middleware.use ExceptionNotification::Rack,
  #   :email => {
  #     # :email_prefix => "[Whatever] ",
  #     :sender_address => %{"اتویابی notifier" <noreply@hamsafaryab.com>},
  #     :exception_recipients => %w{hamsafaryab@gmail.com}
  #   }
  # config.action_mailer.delivery_method = :letter_opener    

  # for devise
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }


  config.action_mailer.smtp_settings = {
    address: "mail51.webspaceconfig.de",
    port: 25,
    # :port => 25,
    domain: 'webspaceconfig.de',
    authentication: :plain,
    enable_starttls_auto: true,
    # user_name: ENV['GMAIL_USER_NAME'],
    # password: ENV['GMAIL_PASSWORD']
    user_name: 'p110180p66',
    password: 'uyuzaBot,838'
  }

  # config.middleware.use ExceptionNotification::Rack,
  #   :email => {
  #     # :email_prefix => "[Whatever] ",
  #     :sender_address => %{"opc" <noreply@opc.de>},
  #     :exception_recipients => %w{hrmohseni@yahoo.com}
  #   }
    
  config.action_mailer.delivery_method = :smtp
  # config.action_mailer.delivery_method = :letter_opener

end
