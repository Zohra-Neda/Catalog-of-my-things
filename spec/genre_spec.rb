require 'date'
require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  let(:params) { { name: 'Rock' } }
  let(:genre) { Genre.new(params) }

  describe '#initialize' do
    it 'should set the name, generate an id, and initialize an empty items array' do
      expect(genre.name).to eq('Rock')
      expect(genre.id).to be_a(Integer)
      expect(genre.items).to be_an(Array)
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:item) { Item.new(id: 1, genre: 'Rock', author: 'Artist', label: 'Label', publish_date: '2000-01-01') }

    it 'should add an item to the genre and associate the genre with the item' do
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end

    it 'should not add the same item multiple times' do
      2.times { genre.add_item(item) }
      expect(genre.items.length).to eq(1)
    end
  end
end
