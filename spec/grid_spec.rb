require 'spec_helper'
require 'grid'

describe 'Grid' do
  let(:grid) { Grid.new }

  describe '#dimension' do
    it 'returns the dimension of the grid' do
      expect(grid.dimension).to eq(3)
    end
  end
end
