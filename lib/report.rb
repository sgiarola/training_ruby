class Report

  def initialize(library)
    @library = library
  end

  def total
    @library.books.inject(0) { |tot, book| tot += book.price }
  end

  def titles
    @library.books.map { |book| book.title }
  end
end
