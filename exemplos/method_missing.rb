# Quando você quiser agir de maneira diferente de acordo com o nome do método que foi invocado,
#  e você não souber todos os nomes dos métodos, ou você quiser suportar infinitos nomes de métodos
#  possíveis, você pode subscrever o “method_missing”, lembrando de sempre tomar cuidado e subscrever
#  também o método “respond_to”.

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
  def respond_to?(name)
    name.to_s.match("(.+)_que_mais_vendeu_por_(.+)") 
  end

    # Toda a vez que implementamos um método de “missing”, pra mudar o comportamento de métodos que respondemos, 
    # precisamos subscrever também um método “respond_to”.

#No nosso caso, nós vamos verificar se a chamada de método for equivalente ao método que esperamos, 
# ou se a nossa classe pai responde por esse método, então vamos devolver algo que tenha valor verdadeiro.