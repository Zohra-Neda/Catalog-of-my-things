require_relative '../classes/game'
require 'date'

describe Game do
  arr = {
    'multiplayer' => 'John',
    'archived' => true,
    'last_played_at' => '2022-01-01',
    'publish_date' => '2022-01-01'
  }

  context 'When you create a instance of the game' do
    it 'has a multiplayer, archived and last_played_at' do
      game = Game.new(arr)

      expect(game.multiplayer).to eq('John')
      expect(game.last_played_at).to eq(Date.parse('2022-01-01'))
    end
  end

  context 'when you want check can_be_archived' do
    it 'can check can_be_archived' do
      game = Game.new(arr)

      expect(game.can_be_archived?).to eq(false)
    end
  end
end
