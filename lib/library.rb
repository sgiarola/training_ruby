module EasyPurchase
	class Library

		prepend Enumerable

		def initialize
			@renteds = ::Array.new
			@database_file = DatabaseFile.new
		end

		attr_accessor :renteds

		def midias
			@midias ||= @database_file.load
		end

		def rent(midia)
			@renteds << midia
		end

		def add(midia)
			save midia do
				midias << midia
			end
		end

		def midias_by_category(category)
			midias.select do |midia|
				midia.category == category if midia.respond_to? :category
			end
		end

		def each
			midias.each { |midia| yield midia }
		end

		private

		def save(midia)
			@database_file.save midia
			yield
		end
	end
end
