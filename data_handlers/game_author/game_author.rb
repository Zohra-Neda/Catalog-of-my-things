module GameAndAuthor
  def list_all_games
    if @games.empty?
      puts 'No game available.'
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1}) Multiplayer: #{game.multiplayer}, Last player Date: #{game.last_played_at}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'No author available.'
    else
      @authors.each_with_index do |label, index|
        puts "#{index + 1}) First name: #{label.first_name}, Last Name: #{label.last_name}"
      end
    end
  end

  def add_game
    last_played_at = get_input('Please Enter last played at in following format: yyyy/mm/dd')
    multiplayer = get_input('Enter multiplayer')

    game = Game.new(last_played_at: last_played_at, multiplayer: multiplayer)
    author = add_author
    game.label = author.first_name
    @games << game
    puts 'Game Added Successfully'
  end

  def add_author
    puts 'Add a author'
    first_name = get_input('Enter First Name')
    last_name = get_input('Enter Last Name')
    author = Author.new(first_name: first_name, last_name: last_name)
    @authors << author
    author
  end

  def get_input(message)
    puts message
    gets.chomp
  end
end
