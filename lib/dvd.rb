class Dvd < Midia

  def initialize(title, price, category)
    @title = title
    @price = price
    @category = category
  end

  def to_s
    %Q{ Título: #{@title}, Preço: #{@price}, Category: #{@category} }
  end
end
