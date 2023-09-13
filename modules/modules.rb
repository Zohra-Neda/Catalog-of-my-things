require_relative 'book_label/book_label'
require_relative 'book_label/load_book_label'
require_relative 'book_label/save_book_label'


module Modules
  include BookAndLabel
  include LoadBookAndLabelData
  include SaveBookAndLabelData

  def load_collection
    load_books
    load_labels
  end

  def save_collection
    save_book
    save_label
  end
end
