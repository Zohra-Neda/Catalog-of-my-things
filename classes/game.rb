require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(params)
    super(params)
    @multiplayer = params['multiplayer']
    @last_played_at = create_date(params['last_played_at'])
  end

<<<<<<< HEAD
=======
    @multiplayer = params['multiplayer']
    @last_played_at = create_date(params['last_played_at'])
  end

>>>>>>> 5944ea7d437137043bdd6764bb2e7ca61efcc98f
  def create_date(date_string)
    return nil if date_string.nil?

    Date.parse(date_string.to_s)
  end

  def can_be_archived?
    super && (Date.today - @played_at_date).to_i / 365 > 2
  end
end
