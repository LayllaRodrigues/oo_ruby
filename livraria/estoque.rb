require_relative "contador"

class Estoque
  attr_reader :livros

  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  def quantidade_de_vendas_por(produto, &campo)
    @vendas.count { |venda| campo.call(venda) == campo.call(produto) }
  end

  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select { |l| l.tipo == tipo }.sort { |v1, v2| quantidade_de_vendas_por(v1, &campo) <=> quantidade_de_vendas_por(v2, &campo) }.last
  end

  def method_missing(name)
    matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
    if matcher
      tipo = matcher[1]
      campo = matcher[2].to_sym
      que_mais_vendeu_por(tipo, &campo)
    else
      super
    end
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

  def <<(livro)
    @livros << livro if livro
    self
  end

  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end

  def vende(livro)
    @livros.delete livro
    @vendas << livro
  end

  def maximo_necessario
    @livros.maximo_necessario
  end
end

class Float
  def para_dinheiro
    valor = "R$" << self.to_s.tr(".", ",")
    valor << "0" unless valor.match /(.*)(\d{2})$/
    valor
  end
end

class Conversor
  def string_para_alfanumerico(nome)
    nome.gsub /[^\w\s]/, ""
  end
end
