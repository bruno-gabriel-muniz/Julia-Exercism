"""
  Função que rotaciona as letras do alfabeto
  de uma string de acordo com uma chave
"""
function rotate(NumRot::Int, Palavra)
  # Retirando o resto da chave pelo tamanho do alfabeto
  # para que fique apenas o indice de rotação básico
  NumRotSimple = NumRot % 26
  # Verificando se a chave simples e 0,
  # pois, caso seja, nao sera nescessaria
  # nenhuma intervencao 
  if NumRotSimple == 0
    return Palavra
  end
  # Criando a string que vai conter a palavra criptografada
  PalavraCriptografada = ""
  # Passando por todos os carcateres da string
  # para rotaciona-los
  for caractere in Palavra
    # Verificando qual e o codigo ASCII do carctere
    CodeCaractere = Int(caractere)
    # Verificando se e maiusculo
    if 65<= CodeCaractere <= 90
      # Aplicando o valor da rotacao
      CodeCaractere += NumRotSimple
      # Verificando se saiu dos codigos do alfabeto
      if CodeCaractere > 90
        # E, se isso aconteceu, subtraimos 26
        # para que o carctere volte do
        # inicio do alfabeto
        CodeCaractere -= 26
      end
    # Ou minusculo  
    elseif 97<= CodeCaractere <= 122
      # Aplicando o valor da rotacao
      CodeCaractere += NumRotSimple
      # Verificando se saiu dos codigos do alfabeto
      if CodeCaractere > 122
        # E, se isso aconteceu, subtraimos 26
        # para que o carctere volte do
        # inicio do alfabeto
        CodeCaractere -= 26
      end
    end
    # E adicionando o digito cripitografado
    # na string final 
    PalavraCriptografada *= Char(CodeCaractere)
  end
  # Demonstrando a saida do programa
  println("$Palavra => $PalavraCriptografada")
  # Verificando se a saida esta no formato de Char
  # para correcao dos tipos da saida do programa
  if typeof(Palavra) == Char
    # retornando no formato correto
    return first(PalavraCriptografada)
  end
  # retornando no formato correto
  return PalavraCriptografada
end

"""
  Macro que chama a funcao rotate com a chave 13
  apartir da seguinte sintax: R13"String a ser criptografada" 
"""
macro R13_str(str)
  rotate(13, str)
end