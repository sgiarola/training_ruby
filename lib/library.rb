class Library

	def initialize
		@books = {}
		@renteds = []
		@database_file = DatabaseFile.new
	end

	attr_accessor :renteds

	def books
		@books.values.flatten
	end

	def rent_book(book)
		@renteds << book
	end

	def add_book(book)
		save book do
			@books[book.category] ||= []
			@books[book.category] << book
		end
	end

	def books_by_category(category)
		@books[category].each do |book|
			yield book if block_given?
		end
	end

	private

	def save(book)
		@database_file.save book
		yield
	end
end
