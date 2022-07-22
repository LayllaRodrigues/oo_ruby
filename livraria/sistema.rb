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

algoritmos = Livro.new("Algoritmos", 100, 1998, true, "")
ruby = Livro.new("Programming Ruby", 100, 2004, true,"")
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true,"")
design = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true, "")

estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << design << ruby << ruby << ruby 
estoque.vende ruby

estoque.vende algoritmos

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
