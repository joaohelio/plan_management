require 'sinatra/base'
require 'sinatra/activerecord'

APP_ROOT = File.expand_path(".", __dir__)

# require the controller(s)
# says that app.rb is in the root
Dir.glob(File.join(APP_ROOT, "app", "*.rb")).each { |file| require file }

# require the model(s)
# models stored in lib/
Dir.glob(File.join(APP_ROOT, "models", "*.rb")).each { |file| require file }
Dir.glob(File.join(APP_ROOT, "entities", "*.rb")).each { |file| require file }
Dir.glob(File.join(APP_ROOT, "repositories", "*.rb")).each { |file| require file }
Dir.glob(File.join(APP_ROOT, "lib", "*.rb")).each { |file| require file }
Dir.glob(File.join(APP_ROOT, "controllers", "*.rb")).each { |file| require file }

class PlansApi < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database_file, File.join(APP_ROOT, "config", "database.yml")
  set :root, APP_ROOT

  use PlansController

  # Define a fallback route for 404 errors
  not_found do
    '404 error!'
  end
end
