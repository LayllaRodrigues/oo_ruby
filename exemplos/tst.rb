class Cliente
    def initialize(nome, idade)
      @nome = nome
      @idade = idade
      debug_me
    end
  
    def debug_me
       puts "#{@nome},#{@idade}"
    end
  end
  
  class Cliente
  
    #declarando o metodo agora como privado
    private
    def debug_me
      puts "um outro metodo de debug"
    end
  end
  
  Cliente.new("carlos", 30)
  

livros_computacao = ["Agile Web Development with Rails", "Domain Driven Design", "Programming Ruby 1.9", "Agile Web Development with Rails"]

def livros_computacao.length
  unique = []
  self.each do |item|
    unique.push(item) unless unique.include?(item)
  end
  unique.length

end