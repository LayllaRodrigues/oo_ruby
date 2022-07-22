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

module Contador
  def << (livro)
    push (livro)
    if @maximo_necessario.nil? || @maximo_necessario < size
      @maximo_necessario = size
    end
    self
  end

  attr_reader :maximo_necessario
end

class Estoque
  attr_reader :livros

  def initialize
    @livros = []
    @livros.extend Contador
  
    def exporta_csv
    @livros.each do |livro|
      puts "#{livro.titulo},#{livro.ano_lancamento}"
      end
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

  def <<(livro)
    @livros << livro if livro
    self
  end

  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end

  def remove(livro)
    @livros.delete livro
  end

  def maximo_necessario
    @livros.maximo_necessario
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

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
ruby = Livro.new("Programming Ruby", 100, 2004, true)
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true)
design = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true)

estoque = Estoque.new
estoque <<  algoritmos
puts estoque.maximo_necessario
estoque <<  ruby
puts estoque.maximo_necessario
estoque <<  programmer 
puts estoque.maximo_necessario
estoque <<  design
puts estoque.maximo_necessario

estoque.remove algoritmos
puts estoque.maximo_necessario