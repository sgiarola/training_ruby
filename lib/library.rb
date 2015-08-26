module EasyPurchase
	class Library

		prepend Enumerable

		def initialize
			@renteds = []
			@database_file = DatabaseFile.new
		end

		attr_accessor :renteds

		def books
			@books ||= @database_file.load
		end

		def rent(book)
			@renteds << book
		end

		def add(book)
			save book do
				books << book
			end
		end

		def books_by_category(category)
			book.select { |book| book.category == category }
		end

		def each
			books.each { |book| yield book }
		end

		private

		def save(book)
			@database_file.save book
			yield
		end
	end
end
