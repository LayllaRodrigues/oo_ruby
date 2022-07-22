require_relative "livro"
require_relative "estoque"
require_relative "revista"
require_relative "ebook"

algoritmos = Livro.new("Programacao OO Ruby", 70, 2000, true, "Globo", true)
livro_arquitetura_software = Livro.new("Arquitetura de software", 70, 2000, true, "Globo2", true)
revista = Revista.new("Revista de Ruby", 10, 2012, true, 3, "Globo")
ebook = Ebook.new("Ebook de Ruby", 10, 2012, "Globo")

estoque = Estoque.new
estoque << algoritmos << algoritmos
estoque << livro_arquitetura_software << livro_arquitetura_software
estoque << revista << revista << revista

estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende livro_arquitetura_software
estoque.vende revista
estoque.vende revista
estoque.vende ebook

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts estoque.ebook_que_mais_vendeu_por_titulo.titulo
puts estoque.respose_to?(:ebook_que_mais_vendeu_por_titulo)
