class Midia

  attr_accessor :price
  attr_reader :title

  def initialize
    @discount = 0.1
    @price = 10.0
  end

  def price_with_discount
    @price - (@price * @discount)
  end
end
