class Cliente
    def initialize(nome)
      @nome = nome
    end
    private
    def nome
      @nome
    end
  end
  
  puts Cliente.new("guilherme").nome

#   Como não podemos acessar métodos privados a um objeto de fora dele, o código acima gera um erro de acesso a método privado.

Saida 

# tst.rb:11:in `<main>': private method `nome' called for #<Cliente:0x00000001087dca68 @nome="guilherme"> (NoMethodError)

#   puts Cliente.new("guilherme").nome

# EXEMPLO 2:

module Gerador
  private
  def gera_codigo
    "gerador original"
  end
end

class Cliente
  include Gerador

  def gera_codigo
    "novo gerador"
  end
end

puts Cliente.new.gera_codigo

#   Ao escrever novamente o método gera_codigo em nossa classe Cliente,
#  o método privado antigo fica escondido, portanto a chamada ao método gera_codigo funciona normalmente.

# novo gerador


# EXEMPLO 3
module Gerador
  private
  def gera_codigo
    "gerador original"
  end
end

class Cliente

  def gera_codigo
    "novo gerador"
  end

  include Gerador
end

puts Cliente.new.gera_codigo

# A ordem de busca de um método dentro de um objeto,
#  antes de procurar em um módulo incluído, procura primeiro 
# na definição da classe a qual o objeto pertence. Portanto por
#  mais que o módulo seja incluído posteriormente, o interpretador do Ruby encontrará sempre o método na classe Cliente, imprimindo "novo gerador".