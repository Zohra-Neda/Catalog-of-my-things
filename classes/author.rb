class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(params)
<<<<<<< HEAD
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
=======
    @id = params[:id] || rand(1..10_000)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @items = []
>>>>>>> 51de56f1f115c6dec989d57728d5480527962e85
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.add_author(self)
  end
end
