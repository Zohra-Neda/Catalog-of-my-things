require 'date'
require_relative '../classes/genre'

describe Genre do
  let(:params) { { name: 'Rock' } }
  let(:genre) { Genre.new(params) }
  let(:item1) { double('Item1') }

  describe '#initialize' do
    it 'should set the name, generate an id, and initialize an empty items array' do
      expect(genre.name).to eq('Rock')
      expect(genre.id).to be_a(Integer)
      expect(genre.items).to be_an(Array)
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'should add an item to the genre and associate the genre with the item' do
      expect(item1).to receive(:add_genre).with(genre).once
      genre.add_item(item1)
      expect(genre.items).to include(item1)
    end

    it 'should not add the same item multiple times' do
      expect(item1).to receive(:add_genre).with(genre).once
      genre.add_item(item1)
      genre.add_item(item1) # We expect it to be called once, so it should not be added again.
      expect(genre.items.length).to eq(1)
    end
  end
end
