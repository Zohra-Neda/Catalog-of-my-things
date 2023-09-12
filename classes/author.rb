require_relative 'item'

class Author < Item
  attr_accessor :id, :first_name, :last_name
  attr_reader :items

  def initialize(params)
    super(params)

    @id = params['id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
