require_relative './item'

class Game <  Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(params)
    super(params)

    @multiplayer = params["#{:multiplayer}"]
    @last_played_at = params["#{:last_played_at}"]
  end

  def create_date(date_string)
    return nil if date_string.nil?

    Date.parse(date_string.to_s)
  end

  def can_be_archived?
    @archived
  end
end