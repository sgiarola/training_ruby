class Cd < Midia

  prepend MoneyFormat

  def initialize(title, price, category)
    @title = title,
    @price = price,
    @category = category
  end

  def to_s
    %Q{ Title: #{@title}, Price: #{@price} }
  end
end
