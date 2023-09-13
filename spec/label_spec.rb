require_relative '../classes/item'
require_relative '../classes/label'

RSpec.describe Item do
  let(:item_params) do
    {
      id: 123,
      genre: 'Mystery',
      author: 'Agatha Christie',
      label: nil,
      publish_date: Date.new(1926, 1, 21),
      archived: false
    }
  end

  describe '#initialize' do
    it 'creates an item object' do
      item = Item.new(item_params)

      expect(item).to be_an_instance_of(Item)
      expect(item.id).to eq(123)
      expect(item.genre).to eq('Mystery')
      expect(item.author).to eq('Agatha Christie')
      expect(item.label).to be_nil
      expect(item.publish_date).to eq(Date.new(1926, 1, 21))
      expect(item.archived).to be_falsey
    end
  end

  describe '#add_genre' do
    it 'adds a genre to the item' do
      item = Item.new(item_params)

      item.add_genre('Thriller')

      expect(item.genre).to eq('Thriller')
    end
  end

  describe '#add_author' do
    it 'adds an author to the item' do
      item = Item.new(item_params)

      item.add_author('Stephen King')

      expect(item.author).to eq('Stephen King')
    end
  end

  describe '#add_label' do
    it 'adds a label to the item and the label\'s list of items' do
      item = Item.new(item_params)
      label = Label.new(title: 'Mystery', color: 'red')

      item.add_label(label)

      expect(item.label).to eq(label)
      expect(label.items).to include(item)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the item is more than 10 years old' do
      item = Item.new(item_params)

      result = item.can_be_archived?

      expect(result).to be_truthy
    end

    it 'returns false if the item is less than 10 years old' do
      item_params[:publish_date] = Date.today - (5 * 365) # 5 years ago
      item = Item.new(item_params)

      result = item.can_be_archived?

      expect(result).to be_falsey
    end
  end

  describe '#move_to_archive' do
    it 'archives the item if it can be archived' do
      item = Item.new(item_params)

      item.move_to_archive

      expect(item.archived).to be_truthy
    end

    it 'does not archive the item if it cannot be archived' do
      item_params[:publish_date] = Date.today - (5 * 365) # 5 years ago
      item = Item.new(item_params)

      item.move_to_archive

      expect(item.archived).to be_falsey
    end
  end
end
