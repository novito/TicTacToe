require 'factory_girl'
require_relative '../spec/factories/human_players.rb'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
