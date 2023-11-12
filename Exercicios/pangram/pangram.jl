"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    alfabeto = Dict("a" => false, "b" => false, "c" => false, "d" => false,
                    "e" => false, "f" => false, "g" => false, "h" => false,
                    "i" => false, "j" => false, "k" => false, "l" => false,
                    "m" => false, "n" => false, "o" => false, "p" => false,
                    "q" => false, "r" => false, "s" => false, "t" => false,
                    "u" => false, "v" => false, "w" => false, "x" => false,
                    "y" => false, "z" => false)
    input = lowercase(input)
    count = 0
    for letra in input
        try
            alfabeto[string(letra)] = true
            count += 1
        catch
            continue
        end
    end
    if count >= 26
        for (letra, verificador) in alfabeto
            if !verificador
                return false      
            end
        end
        return true
    end
    return false
end
