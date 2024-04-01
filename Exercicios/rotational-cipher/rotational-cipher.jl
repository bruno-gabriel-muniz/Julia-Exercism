using Unicode
"""
  Função que rotaciona o alfabeto de acordo com uma chave
"""
function rotate(NumRot::Int, Palavra)
  NumRotSimple = NumRot % 26
  if NumRotSimple == 0
    return Palavra
  end
  PalavraCriptografada = ""
  for caractere in Palavra
    CodeCaractere = Int(caractere)
    if 65<= CodeCaractere <= 90
      CodeCaractere += NumRotSimple
      if CodeCaractere > 90
        CodeCaractere -= 26
      end
    elseif 97<= CodeCaractere <= 122
      CodeCaractere += NumRotSimple
      if CodeCaractere > 122
        CodeCaractere -= 26
      end
    end
    PalavraCriptografada *= Char(CodeCaractere)
  end
  println(PalavraCriptografada)
  if typeof(Palavra) == Char
    return first(PalavraCriptografada)
  end
  return PalavraCriptografada
end

macro R13_str(str)
  rotate(13, str)
end