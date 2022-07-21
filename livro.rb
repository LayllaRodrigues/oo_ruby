class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao
  end

  def to_csv
    "#{@titulo},#{@ano_lancamento},#{@preco}"
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  private
  def calcula_preco(preco_base)
    if ano_lancamento < 2006
      if @possui_reimpressao
        preco_base * 0.9
      else
        preco_base * 0.95
      end
    elsif @ano_lancamento <= 2010
      preco_base * 0.96
    else
      preco_base
    end
  end
end
class Estoque
  def initialize
    @livros = []
  end

  def exporta_csv
    @livros.each do |livro|
      puts "#{livro.titulo},#{livro.ano_lancamento}"
    end
  end

  def mais_barato_que(valor)
    @livros.select do |livro|
      livro.preco <= valor
    end
  end

  def total
    @livros.size
    puts "O total de livros no estoque é: #{@livros.size}"
    puts "\n"
  end

  def adiciona(livro)
    @livros << livro if livro
  end

  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end
end


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

estoque = Estoque.new
estoque.adiciona  Livro.new("Algoritmos", 100, 1998, true)
estoque.adiciona  Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true)
estoque.adiciona  Livro.new("The Pragmatic Programmer", 100, 1999, true)
estoque.adiciona  Livro.new("Programming Ruby", 100, 2004, true)
estoque.adiciona nil

estoque.total
estoque.exporta_csv

baratos = estoque.mais_barato_que 80
baratos.each do |livro|
  puts "\n"
  puts "O livro mais barato é o: #{livro.titulo}, por #{livro.preco} reais."
end