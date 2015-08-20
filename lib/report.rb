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

  # Using lambda and curryng only for study
  def fine_of_rented_books
    fine_percent = lambda { |percent, price| percent * price }.curry
    fine_ten_percent = fine_percent.call 0.1
    @library.renteds.map { |book| fine_ten_percent.call book.price }
  end
end
