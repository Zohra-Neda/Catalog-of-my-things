require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(params)
    super(params)

    @multiplayer = params['multiplayer']
    @last_played_at = params['last_played_at']
  end

  def can_be_archived?
    @archived
  end
end
