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

  describe '#mark_cell' do
    it 'marks a cell with the passed parameter' do
      grid.mark_cell(0, 'J')
      expect(grid.status.first).to eq('J')
    end
  end

  describe '#has_winner?' do
    context 'when there is a winner' do
      it 'returns true' do
        (0..2).each do |c|
          grid.mark_cell(c, 'J')
        end

        expect(grid.has_winner?).to be(true)
      end
    end

    context 'when there is no winner' do
      it 'returns false' do
        expect(grid.has_winner?).to be(false)
      end
    end
  end
end
