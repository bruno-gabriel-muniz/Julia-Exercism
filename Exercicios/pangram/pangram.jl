"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    # Criando o dicionário que ira conter todas as letras do alfabeto como
    # chaves e os valores como uma variável boleana que verifica se a letra
    # foi usada ou não
    alfabeto = Dict("a" => false, "b" => false, "c" => false, "d" => false,
                    "e" => false, "f" => false, "g" => false, "h" => false,
                    "i" => false, "j" => false, "k" => false, "l" => false,
                    "m" => false, "n" => false, "o" => false, "p" => false,
                    "q" => false, "r" => false, "s" => false, "t" => false,
                    "u" => false, "v" => false, "w" => false, "x" => false,
                    "y" => false, "z" => false)
    # Transformando as letras da entrada em minusculas, para que a função
    # não seja case sensitive
    input = lowercase(input)
    # criando uma variável contadora para verificar se pelo menos 26 letras
    # foram usadas na frase e, caso contrário, interrompe a verificação. Já
    # que, neste caso, será impossível ser um pangram, pois o alfabeto tem 26
    # letras
    CountLetras = 0
    # passando por um for que passa por todos os carcteres da string da entrada
    for letra in input
        # verificando se
        try
            # é uma letra do alfabeto e alterando o valor verificador da letra
            # para verdadeiro caso seja
            alfabeto[string(letra)] = true
            # e adicionando a variável contadora de letras
            CountLetras += 1
        catch
            # e, caso não seja, passando para o próximo carctere
            continue
        end
    end
    # verificamos se foram encontradas pelo menos 26 letras
    if CountLetras >= 26
        # se sim, passamos por todos os valores do dicionário
        for (letra, verificador) in alfabeto
            # verificando se um dos verificadores das letras é falso
            if !verificador
                # assim, caso seja, devolvemos que não é um pangram 
                return false      
            end
        end
        # ou devolvemos que é um pangram caso nenhum seja falso
        return true
    end
    # e caso não tenha 26 letras, devolvemos que não é um pangram
    return false
end
