class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  def initialize(titulo, preco, ano_lancamento)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
  end

  private

  def calcula_preco(preco_base)
    if ano_lancamento < 2000
      preco_base * 0.7
    else
      preco_base
    end
  end
end

def livro_para_newsletter(livro)
  if livro.ano_lancamento < 1999
    puts "Newsletter/Liquidacao"
    puts livro.titulo
    puts livro.preco
  else
    puts "Newsletter/Lançamentos"
    puts livro.preco
    puts livro.titulo
  end


end

algoritimos = Livro.new("Algoritimos", 100, 1998)
livro_para_newsletter(algoritimos)

ruby = Livro.new("Ruby", 150, 2001)
livro_para_newsletter(ruby)