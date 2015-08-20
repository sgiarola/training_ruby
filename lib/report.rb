class Report

  def initialize(library)
    @library = library
  end

  def total
    @library.books.map(&:price).inject(:+)
  end

  def titles
    @library.books.map &:title
  end

  def fine_of_ten_percent(book_price)
    fine_percent = lambda { |percent, price| percent * price }.curry
    fine_ten_percent = fine_percent.call 0.1
    fine_ten_percent.call book_price
  end
end
