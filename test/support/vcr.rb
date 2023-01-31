require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = false
  c.filter_sensitive_data('<TMDB_API_KEY>') { ENV['TMDB_API_KEY'] }
end