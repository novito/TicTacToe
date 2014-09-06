require 'machine_player'
require 'spec_helper'

describe MachinePlayer do
  let(:machine_player) { build(:machine_player, name: 'Dr Who') }

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
end
