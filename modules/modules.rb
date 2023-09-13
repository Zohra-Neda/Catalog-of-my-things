require_relative 'book_label/book_label'
require_relative 'book_label/load_book_label'
require_relative 'book_label/save_book_label'
require_relative 'game_author/game_author'
require_relative 'game_author/load_game_author'
require_relative 'game_author/save_game_author'
module Modules
  include BookAndLabel
  include LoadBookAndLabelData
  include SaveBookAndLabelData
  include GameAndAuthor
  include LoadGameAndAuthorData
  include SaveGameAndAuthorData

  def load_collection
    load_books
    load_labels
    load_games
    load_authors
  end

  def save_collection
    save_book
    save_label
    save_games
    save_authors
  end
end
