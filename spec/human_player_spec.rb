require 'human_player'

describe HumanPlayer do
  let(:human_player) { create(:human_player, name: 'Hommer Simpson') }

  describe '#initialize' do
    context 'when name is blank' do
      it 'should raise an error' do
        expect {HumanPlayer.new(' ')}.to raise_error(ArgumentError)
      end
    end
  end
end
