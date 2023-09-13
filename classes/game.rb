require_relative 'item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :played_at_date
  attr_reader :authors

  def initialize(params)
    super(params)
    @multiplayer = params[:multiplayer]
    @played_at_date = params[:played_at_date]
  end

<<<<<<< HEAD
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
=======
  private

  def can_be_archived
>>>>>>> 51de56f1f115c6dec989d57728d5480527962e85
    super && (Date.today - @played_at_date).to_i / 365 > 2
  end
end