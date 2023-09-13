require 'json'

module SaveGameAndAuthorData
  def save_to_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_games
    games_hash = @games.map do |game|
      {
        multiplayer: game.multiplayer, last_played_at: game.last_played_at
      }
    end
    save_to_file('data/game.json', games_hash)
  end

  def save_authors
    author_hash = @authors.map do |author|
      {
        first_name: author.first_name, last_name: author.last_name, id: author.id
      }
    end
    save_to_file('data/author.json', author_hash)
  end
end
