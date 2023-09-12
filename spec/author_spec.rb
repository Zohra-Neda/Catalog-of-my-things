require_relative '../classes/author'

describe Author do
  arr = {
    'id' =>122,
    'first_name' => 'Yemi',
    'last_name' => 'Dada'
  }

  context 'When you create a instance of the author' do
    it 'has a id, first_name and last_name' do
      author = Author.new(arr)

      expect(author.id).to eq(122)
      expect(author.first_name).to eq('Yemi')
      expect(author.last_name).to eq('Dada')
    end
  end

  context 'when you want a item' do
    it 'can add item' do
      author = Author.new(arr)
      item = double('Item')
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end
end
