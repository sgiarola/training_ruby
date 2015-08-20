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

  def fine_of_ten_percent_book_value_a_day(days, book)
    fine_percent = lambda { |percent, book_price| percent * book_price }.curry
    fine_ten_percent = fine_percent.call 0.1 * days
    fine_ten_percent.call book.price
  end
end
