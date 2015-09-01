class Dvd < Midia

  attr_reader :title

  include MoneyFormat
  format_money :price_with_discount, :price

  def initialize(title, price, category)
    super()
    @title = title
    @price = price
    @category = category
  end
end
