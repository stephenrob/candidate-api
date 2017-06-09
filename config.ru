require_relative 'config/environment'
# require 'raven'
#
# Raven.configure do |config|
#   config.dsn = ENV['SENTRY_DSN']
# end
#
# use Raven::Rack

require 'sinatra/base'
require_relative 'app/application'
# require_relative 'api/api_controller'

Dir.glob('./api/*.rb').each { |file| require file }

map "/" do
  run ApiController
end