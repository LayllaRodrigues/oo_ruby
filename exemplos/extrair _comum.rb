# Tanto a classe Livro como a classe Revista representam produtos impressos. 
# Por isso, ambas têm um método possui_impressao? e recebem um parâmetro possui_impressao, 
# ou seja, as duas classes têm código repetido.
# Qual a melhor solução para extrair esse comportamento comum?

puts "Extrair o método para um módulo Impresso e deixar o código repetido no construtor"


# # Podemos extrair esse comportamento comum para um módulo Impresso,
#  por exemplo. No entanto, o construtor não pode ir para o módulo também, senão o módulo passa a ficar
#   muito acoplado à forma como ele é incluído pelas classes.

# # Poderíamos usar herança, também, mas um Livro não é exatamente um Impresso:
#  ele tem o comportamento de um produto Impresso. Queremos apenas adicionar comportamento ao Livro,
#  não mudar a semântica dele.

