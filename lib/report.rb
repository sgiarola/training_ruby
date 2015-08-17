class Report

  def initialize(library)
    @library = library
  end

  def total

    sum = 0

    @library.books.each do |book|
      sum += book.price
    end

    sum

  end

end
