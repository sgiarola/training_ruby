class Book

	def initialize(actor, isbn="1", number_of_pages, price, category, title)
		@title = title
		@actor = actor
		@isbn = isbn
		@number_of_pages = number_of_pages
		@price = price
		@category = category
	end

	attr_accessor :price
	attr_reader :category, :title, :isbn, :actor

	def to_s
		"Actor: #{@actor}, Isbn: #{@isbn}, Pages: #{@number_of_pages}, Price: #{@price}, Category: #{@category}"
	end

	def eql?(other_book)
		@isbn == other_book.isbn
	end

	def hash
		@isbn.hash
	end
end
