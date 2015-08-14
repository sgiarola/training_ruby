class Book

	def initialize(autor, isbn="1", numero_de_paginas, preco)
		@autor = autor
		@isbn = isbn
		@numero_de_paginas = numero_de_paginas
		@preco = preco
	end

	attr_accessor :preco

	def to_s
		"Autor: #{@autor}, Isbn: #{@isbn}, Páginas: #{@numero_de_paginas}, Preço: #{@preco}"
	end
end