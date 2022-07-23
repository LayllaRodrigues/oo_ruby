require_relative "livro"
require_relative "estoque"
require_relative "revista"
require_relative "ebook"

algoritmos = Livro.new("Programacao OO Ruby", 70, 2000, true, "Globo", true)
livro_arquitetura_software = Livro.new("Arquitetura de software", 70, 2000, true, "Globo2", true)
revista = Revista.new("Revista de Ruby", 15.00, 2000, true, 3, "Globo")
ebook = Ebook.new("Ebook de Ruby", 10.90, 2012, "Globo")

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

puts "O livro que mais vendeu por titulo foi: #{estoque.livro_que_mais_vendeu_por_titulo.titulo}, e o preço de venda foi: #{estoque.livro_que_mais_vendeu_por_titulo.preco}"
puts "A revista que mais vendeu por titulo foi: #{estoque.revista_que_mais_vendeu_por_titulo.titulo}, e o preço de venda foi: #{estoque.revista_que_mais_vendeu_por_titulo.preco}"
puts "O Ebook que mais vendeu por titulo foi: #{estoque.ebook_que_mais_vendeu_por_titulo.titulo},  e o preço de venda foi: #{estoque.ebook_que_mais_vendeu_por_titulo.preco}"
# puts estoque.respose_to?(:ebook_que_mais_vendeu_por_titulo)
