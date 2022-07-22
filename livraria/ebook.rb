require_relative "produto"

class Ebook
  include Produto

  def initialize(titulo, preco, ano_lancamento, numero, editora)
    @titulo = titulo
    @preco = preco
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @editora = editora
    @numero = numero
  end

  def matches?(query)
    ["ebook", "digital"].include?(query)
  end

  def possui_reimpressao?
    @possui_reimpressao
  end
end
