class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(params)
    @id = params[:id] || rand(1..10_000)
    @genre = params[:genre]
    @author = params[:author]
    @label = params[:label]
    @publish_date = create_date(params[:publish_date])
    @archived = params[:archived] || false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
    @label.items.push(self)
  end

  def create_date(date_string)
    return nil if date_string.nil?

    Date.parse(date_string.to_s)
  end

  def can_be_archived?
    return true if (Date.today - @publish_date).to_i / 365 > 10 # 10 years in days

    false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
