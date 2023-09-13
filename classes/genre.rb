require_relative 'item'

class Genre < Item
  attr_accessor :name
  attr_reader :id, :items

  def initialize(params)
    super(params)
    @id = rand(1..10_000)
    @name = params[:name]
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_genre(self)
  end
end
