class Library

	def initialize
		@books = {}
		@renteds = []
	end

	attr_accessor :renteds

	def books
		@books.values.flatten
	end

	def rent_book(book)
		@renteds << book
	end

	def add_book(book)
		@books[book.category] ||= []
		@books[book.category] << book
	end

	def books_by_category(category)
		@books[category].each do |book|
			yield book if block_given?
		end
	end
end
