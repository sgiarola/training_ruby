module EasyPurchase
	class Set

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
			books.select { |book| book.category == category }
		end

		private

		def save(book)
			@database_file.save book
			yield
		end
	end
end
