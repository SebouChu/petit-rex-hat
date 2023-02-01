Bugsnag.configure do |config|
  config.api_key = ENV["BUGSNAG_RUBY_KEY"]
end unless Rails.env.development?
