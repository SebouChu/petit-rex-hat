Bugsnag.configure do |config|
  config.api_key = ENV["BUGSNGAG_RUBY_KEY"]
end unless Rails.env.development?
