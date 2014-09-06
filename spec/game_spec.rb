require 'spec_helper'
require 'game'

describe 'Game' do
  let(:game) { Game.new }

  describe '#welcome_message' do
    it 'should print a welcome message' do
      expect { game.welcome_message }.to output(/Welcome to the Tic-Tac-Toe game/).to_stdout
    end
  end

  describe '#set_human_player' do
    it 'should set a human player' do
      allow(game).to receive(:gets).and_return('Human name')
      game.set_human_player
      expect(game.human_player).to be_a(HumanPlayer)
    end
  end

  describe '#set_machine_player' do
    it 'should set a machine player' do
      allow(game).to receive(:gets).and_return('Machine name')
      game.set_machine_player
      expect(game.machine_player).to be_a(MachinePlayer)
    end
  end
end
