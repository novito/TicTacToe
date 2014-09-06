require 'factory_girl'
require_relative '../spec/factories/players.rb'
require_relative '../spec/factories/human_players.rb'
require_relative '../spec/factories/machine_players.rb'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
