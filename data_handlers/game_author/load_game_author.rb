require 'json'
require_relative '../../classes/game'
require_relative '../../classes/author'

module LoadGameAndAuthorData
  def load_data_from_file(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end

  def load_authors
    author_hash = []
    return author_hash unless File.exist?('data/author.json')

    author_hash = load_data_from_file('data/author.json')

    author_hash.each do |author|
      label_obj = Author.new(first_name: author['first_name'], last_name: author['last_name'], id: author['id'])
      @labels << label_obj
    end
  end

  def load_games
    game_hash = []
    return game_hash unless File.exist?('data/game.json')

    game_hash = load_data_from_file('data/game.json')
    game_hash.each do |game|
      game_obj = Game.new(multiplayer: game['multiplayer'], last_played_at: game['last_played_at'])
      @games << game_obj
    end
  end
end
