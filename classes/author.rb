class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(params)
    @id = params[:id] || rand(1..10_000)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.add_author(self)
  end
end
