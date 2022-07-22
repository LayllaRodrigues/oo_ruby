require_relative "produto"

class Livro < Produto
  include Impresso

  def initialize(titulo, preco, ano_lancamento, possui_sobrecapa, editora, possui_reimpressao)
    super(titulo, preco, ano_lancamento, editora) # construtor de Produto
    @possui_sobrecapa = possui_sobrecapa
  end

  def matches?(query)
    ["livro", "impresso"].include?(query)
  end
end
