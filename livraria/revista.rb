require_relative "produto"

class Revista < Produto
  include Impresso

  def initialize(titulo, preco, ano_lancamento, numero, editora, possui_reimpressao)
    super(titulo, preco, ano_lancamento, editora) # construtor de Produto
    @numero = numero
  end

  def matches?(query)
    query == "revista" || query == "impresso"
  end
end
