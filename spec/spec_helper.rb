require 'factory_girl'
require_relative '../spec/factories/players.rb'
require_relative '../spec/factories/human_players.rb'
require_relative '../spec/factories/machine_players.rb'
require_relative '../spec/factories/games.rb'
require_relative '../spec/factories/grids.rb'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:all) { silence_output }
  config.after(:all) { enable_output }
end

def silence_output
  @orig_stderr = $stderr
  @orig_stdout = $stdout
 
  # redirect stderr and stdout to /dev/null
  $stderr = File.new('/dev/null', 'w')
  $stdout = File.new('/dev/null', 'w')
end
 
# Replace stdout and stderr so anything else is output correctly.
def enable_output
  $stderr = @orig_stderr
  $stdout = @orig_stdout
  @orig_stderr = nil
  @orig_stdout = nil
end
