require 'spec_helper'
require 'grid'

describe 'Grid' do
  let(:grid) { build(:grid) }

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

  describe '#winner' do
    context 'when there is a winner' do
      it 'returns the winner initial' do
        (0..2).each do |c|
          grid.mark_cell(c, 'J')
        end

        expect(grid.winner).to eq('J')
      end
    end

    context 'when there is no winner' do
      it 'returns nil' do
        expect(grid.winner).to be_nil
      end
    end
  end

  describe '#remove_cell' do
    it 'sets the given cell to nil' do
      grid.mark_cell(0, 'J')
      grid.remove_cell(0)
      expect(grid.status[0]).to be_nil
    end
  end

  describe '#empty?' do
    context 'when grid is empty' do
      it 'returns true' do
        expect(grid.empty?).to be true
      end
    end

    context 'when grid is not empty' do
      it 'returns false' do
        grid.mark_cell(0, 'J')
        expect(grid.empty?).to be false
      end
    end
  end
end
