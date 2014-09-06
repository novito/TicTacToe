require 'human_player'
require 'spec_helper'

describe Player do
  let(:player) { build(:player, name: 'General Player') }

  describe '#initialize' do
    context 'when name is blank' do
      it 'should raise an error' do
        expect {Player.new(' ')}.to raise_error(ArgumentError)
      end
    end

    context 'when name is not blank' do
      it 'should instantiate with a valid name' do
        a_player = Player.new('A Player')
        expect(a_player).to be_a(Player)
      end
    end
  end

  describe '#name' do
    it 'should return the name of the player' do
      expect(player.name).to eql('General Player')
    end
  end

  describe '#initial' do
    it 'should return the first letter of the name (uppercase)' do
      expect(player.initial).to eql('G')
    end
  end
end
