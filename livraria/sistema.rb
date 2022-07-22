require_relative "livro"
require_relative "estoque"

def livro_para_newsletter(livro)
  if livro.ano_lancamento < 1999
    puts "Newsletter/Liquidacao"
    puts livro.titulo
    puts livro.preco
    puts livro.possui_reimpressao?
  else
    puts "Newsletter/Lançamentos"
    puts livro.preco
    puts livro.titulo
  end
end

algoritmos = Livro.new("Algoritmos", 100, 1998, true, "editora", "livro")
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true, "editora", "livro")
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "editora", "livro")
ruby = Livro.new("Programming Ruby", 100, 2004, true, "editora", "livro")
revistona = Livro.new("Revista de Ruby", 10, 2012, true, "Revistas", "revista")

estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby << revistona << revistona
estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revistona
puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo