class Library

	def initialize
		@books = {}
	end

	def books
		@books.values.flatten
	end

	def add_book(book)
		@books[book.category] ||= []
		@books[book.category] << book
	end
end