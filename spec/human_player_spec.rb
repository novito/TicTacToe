require 'human_player'

describe HumanPlayer do
  let(:human_player) { create(:human_player, name: 'Hommer Simpson') }

  describe '#initialize' do
    context 'when name is blank' do
      it 'should raise an error' do
        expect {HumanPlayer.new(' ')}.to raise_error(ArgumentError)
      end
    end

    context 'when name is not blank' do
      it 'should instantiate with a valid name' do
        new_human_player = HumanPlayer.new('Hommer')
        expect(new_human_player).to be_a(HumanPlayer)
      end
    end
  end
end
