require 'machine_player'
require 'spec_helper'

describe MachinePlayer do
  let(:grid) { build(:grid) }
  let(:machine_player) { build(:machine_player, name: 'Dr Who') }
  let(:human_player) { build(:human_player, name: 'Ronaldinho') }

  describe '#initialize' do
    context 'when name is blank' do
      it 'should raise an error' do
        expect {MachinePlayer.new(' ')}.to raise_error(ArgumentError)
      end
    end

    context 'when name is not blank' do
      it 'should instantiate with a valid name' do
        dr_know = MachinePlayer.new('Dr Know')
        expect(dr_know).to be_a(MachinePlayer)
      end
    end
  end

  describe '#name' do
    it 'should return the name of the machine' do
      expect(machine_player.name).to eql('Dr Who')
    end
  end

  describe '#initial' do
    it 'should return the first letter of the name (uppercase)' do
      expect(machine_player.initial).to eql('D')
    end
  end

  describe '#play' do
    context 'grid is empty' do
      it 'makes a move to either the center or one of the corners' do
        expect([0,2,4,6]).to include(machine_player.play(grid, human_player))
      end
    end

    context 'when adversary is one play ahead to win' do
      it 'blocks its move' do
        grid.mark_cell(0, human_player.initial)
        grid.mark_cell(3, human_player.initial)
        grid.mark_cell(4, machine_player.initial)
        expect(machine_player.play(grid, human_player)).to eq(6)
      end
    end

    context 'when it is one play ahead to win' do
      it 'does the correct play to win' do
        grid.mark_cell(0, human_player.initial)
        grid.mark_cell(3, human_player.initial)
        grid.mark_cell(7, human_player.initial)
        grid.mark_cell(4, machine_player.initial)
        grid.mark_cell(6, machine_player.initial)
        expect(machine_player.play(grid, human_player)).to eq(2)
      end
    end
  end
end
