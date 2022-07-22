class Revista
  attr_reader :titulo, :preco, :ano_lancamento, :numero, :editora

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, numero, editora)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @possui_reimpressao = possui_reimpressao
    @numero = numero
    @editora = editora
  end

  def to_csv
    "#{@titulo},#{@ano_lancamento},#{@preco}"
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  def matches?(query)
    query == "revista" || query == "impresso"
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
