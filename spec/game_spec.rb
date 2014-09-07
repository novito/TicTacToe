require 'spec_helper'
require 'game'

describe 'Game' do
  let(:game) { build(:game) }

  describe '#initialize' do
    it 'creates a new 3 dimension grid' do
      expect(game.grid.dimension).to eq(3)
    end
  end

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

  describe '#start' do
    let(:human_player) { build(:human_player) }
    let(:machine_player) { build(:machine_player) }

    before(:each) do
      allow(game).to receive(:human_player).and_return(human_player)
      allow(game).to receive(:machine_player).and_return(machine_player)
    end

    context 'when human chooses to start' do
      it 'should start playing the human' do
        allow(game).to receive(:gets).and_return('y')
        expect(game).to receive(:play).with(human_player, machine_player)
        game.start
      end
    end

    context 'when human chooses to go second' do
      it 'should start playing the machine' do 
        allow(game).to receive(:gets).and_return('n')
        expect(game).to receive(:play).with(machine_player, human_player)
        game.start
      end
    end
  end

  describe '#play' do
    let(:human_player) { build(:human_player) }
    let(:machine_player) { build(:machine_player) }

    context 'when one player is able to place three in a row' do
      it 'finishes the game with a winner' do
        allow(machine_player).to receive(:play).and_return(0,1,2)
        allow(human_player).to receive(:play).and_return(3,7,8)
        allow(game).to receive(:finish).and_return("We have a winner! Congrats #{machine_player.name}")
        allow(game.grid).to receive(:draw)

        expect(game.play(human_player, machine_player)).to eq("We have a winner! Congrats #{machine_player.name}")
      end
    end

    context 'when no player is able to place three in a row' do
      it 'finishes the game in a tie' do
        allow(machine_player).to receive(:play).and_return(0,2,4,7)
        allow(human_player).to receive(:play).and_return(1,3,5,6,8)
        allow(game).to receive(:finish).and_return("Nobody wins. It's a tie!")
        allow(game.grid).to receive(:draw)

        expect(game.play(human_player, machine_player)).to eq("Nobody wins. It's a tie!")
      end
    end
  end
end
