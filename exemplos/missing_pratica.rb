# Agora modifique o seu método method_missing, seguindo os seguintes passos:

# 1) transforme o simbolo (name) em uma string e verifique se ele é uma chamada ao método que_mais_vendeu_por. Algo como:

# name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"COPIAR CÓDIGO
# 2) crie uma variável chamada matcher que receba o resultado dessa verificação.

# 3) faça uma verificação para que se o método que está sendo invocado seja deste tipo, receba o tipo e campo, e faça uma chamada ao método que_mais_vendeu_por(tipo, &campo), pelo contrário delega a chamada ao método pai (super).

# Após concluído compartilhe seu código no espaço abaixo:



# Seu código deve ficar da seguinte forma:

def method_missing(name)
   matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"

   if matcher
      tipo = matcher[1]
      campo = matcher[2].to_sym  #pois precisamos converter para simbolo
      que_mais_vendeu_por(tipo, &campo)
   else
      super
   end
end