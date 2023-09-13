require_relative 'item'

class Author < Item
  attr_accessor :id, :first_name, :last_name

  def initialize(params)
    super(params)

<<<<<<< HEAD
    @id = params['id'] || rand(1..10_000)
    @first_name = params['first_name']
    @last_name = params['last_name']
=======
    @id = params['id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @items = []
>>>>>>> 5944ea7d437137043bdd6764bb2e7ca61efcc98f
  end

  def add_item(item)
    return if @items.include?(item)

    @Items << item
    item.add_author(self)
  end
end
