class Dvd < Midia

  include MoneyFormat

  def initialize(title, price, category)
    super()
    @title = title
    @price = price
    @category = category
  end

  def to_s
    %Q{ Título: #{@title}, Preço: #{@price}, Category: #{@category} }
  end
end
