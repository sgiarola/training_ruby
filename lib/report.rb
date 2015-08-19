class Report

  def initialize(library)
    @library = library
  end

  def total
    @library.books.inject(0) { |tot, book| tot += book.price }
  end

  def titles
    book_titles = []
    @library.books.each do |book|
      book_titles << book.title
    end
    book_titles
  end
end
