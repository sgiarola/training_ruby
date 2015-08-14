class Book

	def initialize(autor, isbn="1", numero_de_paginas, preco, category)
		@autor = autor
		@isbn = isbn
		@numero_de_paginas = numero_de_paginas
		@preco = preco
		@category = category
	end

	attr_accessor :preco
	attr_reader :category
	attr_reader :isbn

	def to_s
		"Autor: #{@autor}, Isbn: #{@isbn}, Páginas: #{@numero_de_paginas}, Preço: #{@preco}, Categoria: #{@category}"
	end

	def eql?(other_book)
		@isbn == other_book.isbn
	end

	def hash
		@isbn.hash
	end
end