require 'human_player'
require 'spec_helper'

describe HumanPlayer do
  let(:human_player) { FactoryGirl.build(:human_player, name: 'Hommer Simpson') }

  describe '#initialize' do
    context 'when name is blank' do
      it 'should raise an error' do
        expect {HumanPlayer.new(' ')}.to raise_error(ArgumentError)
      end
    end

    context 'when name is not blank' do
      it 'should instantiate with a valid name' do
        flanders = HumanPlayer.new('Flanders')
        expect(flanders).to be_a(HumanPlayer)
      end
    end
  end

  describe '#name' do
    it 'should return the name of the player' do
      expect(human_player.name).to eql('Hommer Simpson')
    end
  end

  describe '#initial' do
    it 'should return the first letter of the name (uppercase)' do
      expect(human_player.initial).to eql('H')
    end
  end
end
