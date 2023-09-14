require 'json'

module SaveGameAndAuthorData
  # Save Authors-------------------------
  def save_authors
    File.open('store_data/authors.json', 'w') do |_file|
      File.write('store_data/authors.json', JSON.pretty_generate(@authors.map(&:to_hash)))
    end
    # puts 'Author data saved successfully'
  rescue StandardError => e
    puts "Error saving author data: #{e.message}"
  end

  # Save Game-----------------------------
  def save_games
    File.open('store_data/games.json', 'w') do |_file|
      File.write('store_data/games.json', JSON.pretty_generate(@games.map(&:to_hash)))
    end
    # puts 'Game Data saved successfully'
  rescue StandardError => e
    puts "Error Saving game data: #{e.message}"
  end
end
