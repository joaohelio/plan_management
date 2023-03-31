require 'rack/test'
require 'rspec'

# Load the Sinatra app
require_relative "../app"

module RSpecMixin
  include Rack::Test::Methods
  def app() described_class end
end

RSpec.configure do |config|
  config.include RSpecMixin

  config.before(:each) do
    ActiveRecord::Base.logger = nil
    ActiveRecord::Migration.check_pending!
    ActiveRecord::Base.connection.execute('DELETE FROM plans')
  end

  config.after(:each) do
    ActiveRecord::Base.connection.close
  end
end
