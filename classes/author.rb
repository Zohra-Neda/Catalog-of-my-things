require_relative 'item'

class Author < Item
  attr_accessor :id, :first_name, :last_name

  def initialize(params)
    super(params)

    @id = params['id'] || rand(1..10_000)
    @first_name = params['first_name']
    @last_name = params['last_name']
  end

end

arr = {
    'id' => 122,
    'first_name' => 'Yemi',
    'last_name' => 'Dada'
  }

author = Author.new(arr)

author.add_item