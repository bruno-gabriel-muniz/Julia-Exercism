"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar

"""
function is_leap_year(year)
    # verificando se o ano é divisível por 4, que é a requisição inicial para
    # ser um ano bisexto
    if year % 4 == 0
        # caso seja, verificando se é divisível por 100,
        # a qual é uma das restrições
        if year % 100 == 0
            # se sim, indentificando se é uma das exessões da restrição
            if year % 400 == 0
                # se assim for, então declaramos que é um ano bisexto
                return true
            end
            # Se o ano não for uma exessão da restrição,
            # declaramos que ele não é bisexto
            return false
        end
        # caso não seja divisível por 100 declaramos que é um ano bisexto
        return true
    end
    # e se ele não for divisível por 4
    # declaramos que ele não é um ano bisexto
    return false
end
