require 'spec_helper'
require 'grid'

describe 'Grid' do
  let(:grid) { Grid.new }

  describe '#dimension' do
    it 'returns the dimension of the grid' do
      expect(grid.dimension).to eq(3)
    end
  end

  describe '#draw' do
    it 'draws the grid' do
      allow(grid).to receive(:status).and_return(['J','J','J',nil,nil,nil,nil,nil,nil])
      expect { grid.draw }.to output(/J \| J \| J/).to_stdout
    end
  end
end
