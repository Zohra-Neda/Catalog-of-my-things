require_relative '../classes/item'
require_relative '../classes/book'

RSpec.describe Book do
  let(:book_params) do
    {
      id: 123,
      genre: 'Mystery',
      author: 'Agatha Christie',
      label: 'HarperCollins',
      publish_date: Date.new(1926, 1, 21),
      archived: false,
      publisher: 'William Collins, Sons',
      cover_state: 'good'
    }
  end

  describe '#initialize' do
    it 'creates a book object' do
      book = Book.new(book_params)

      expect(book).to be_an_instance_of(Book)
      expect(book.id).to eq(123)
      expect(book.genre).to eq('Mystery')
      expect(book.author).to eq('Agatha Christie')
      expect(book.label).to eq('HarperCollins')
      expect(book.publish_date).to eq(Date.new(1926, 1, 21))
      expect(book.archived).to be_falsey
      expect(book.publisher).to eq('William Collins, Sons')
      expect(book.cover_state).to eq('good')
    end
  end

  describe '#can_be_archived?' do
    context 'when cover_state is bad' do
      it 'returns true' do
        book.cover_state = 'bad'
        book.move_to_archive
        expect(book.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when the book is less than 10 years old' do
      it 'returns false' do
        book_params[:publish_date] = Date.today

        book = Book.new(book_params)

        expect(book.can_be_archived?).to be_falsey
      end
    end

    context 'when the book cover state is bad' do
      it 'returns true' do
        book_params[:cover_state] = 'bad'

        book = Book.new(book_params)

        expect(book.can_be_archived?).to be_truthy
      end
    end
  end

  describe '#move_to_archive' do
    context 'when the book can be archived' do
      it 'sets archived to true' do
        book = Book.new(book_params)

        book.move_to_archive

        expect(book.archived).to be_truthy
      end
    end

    context 'when the book cannot be archived' do
      it "doesn't change the archived attribute" do
        book_params[:publish_date] = Date.today

        book = Book.new(book_params)

        book.move_to_archive

        expect(book.archived).to be_falsey
      end
    end
  end
end
