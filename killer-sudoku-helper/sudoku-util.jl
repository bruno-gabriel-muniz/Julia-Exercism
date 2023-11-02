"""
Função que remove os números proibidos das possibilidades
(que sempre são número entre 9 e 1) sem usar qualquer coisa 
como remove pois iria recriar a lista varias veses sem nescecidade.
E sim, criando uma lista nova sem qualquer número proibido e já 
invertida para poupar processamento nas próximas partes do programa

Argumentos: NumBloq -> Números que devem ficar fora da lista de número
                      disponíveis
"""
function RetiraNumBloq(NumBloq)
    # criando a lista que ira conter os números disponíveis
    ListNumDesBloq = []
    # passando pelos algarismos de 1 a 9 de forma decrescente
    for NumDesBloq in range(10,1, step=-1)
        # verificando se o número está bloqueado
        if !(NumDesBloq in NumBloq)
            # caso não adicionando ele a lista
            push!(ListNumDesBloq, NumDesBloq)
        end
    end
    # retornando a lista
    return ListNumDesBloq
end 

"""
    Função que Realiza todas as combinações de forma que ela chama
ela mesma para realizar isso.
Argumentos -> QuantNum = quantidade de algarismos que
                        participaram da combinação
           -> ListNumDesBloq = Lista com os números que podem
                              ser usados na combinção
           -> CheckPoint = Número do índice da lista do próximo item a
                          ser combinado
           -> Combinando = variável que é usada apenas dentro da função
    Além disso, essa função funciona através de 'Leyers'. Ou seja, cada vez que ela
for chamada ela percorrerá todos os números desbloqueados que há entre ela e o 9, ou 
o número máximo dos números desbloqueados, chamando os leyers inferiores pelo número
superior mais próximo que faram a mesma coisa.
Exemplo:
    Leyer 1 Leyer 2 Leyer 3
    1       2       3 -> 9
    2       3       4 -> 9
    3       4       5 -> 9
    ...     ...     ....
"""
function CombinaNum(QuantNum, ListNumDesBloq, NumObjetivo, CheckPoint = length(ListNumDesBloq),
               Combinando = Int[], ListCombinaçãoCorreta = Array[])
    # copiando a lista dos números combinados anteriormente ou a lista vázia se esse for o 
    # primeiro leyer
    CombinandoCopy = copy(Combinando)
    # Indicando que passamos para um leyer inferior
    QuantNum -= 1
    # entramos no ciclo que vai fazer as combinações ou chamar os próximos leyers para tal
    while QuantNum > -1 && CheckPoint > 0
        # verificando se estamos no ultimo ultimo leyer
        if QuantNum == 0
            # Se sim, primeiramente, criamos uma copia da combinação do leyer superior
            # para podermos alterar a cópia sem perder processamento para recuperar a original
            CombinandoFinal = copy(CombinandoCopy)
            # Adicionamos o próximo número a ser combinado na copia
            push!(CombinandoFinal, ListNumDesBloq[CheckPoint])
            # testamos para ver se essa combinação se encaixa na requisição
            if VerifComb(CombinandoFinal, NumObjetivo) == 1
                # se sim, adicionamos ela na lista das combinações corretas e avisamos
                # que atingimos o limite para o programa não fazer combinações acima do
                # número objetivo, que são inuteis. Visto que, o valor delas só aumenta
                # conforme o programa as faz. 
                push!(ListCombinaçãoCorreta, CombinandoFinal)
                return ListCombinaçãoCorreta
            else # caso não, avisamos para o programar continuar as combinações e ir para o
                # próximo número disponível
                CheckPoint -= 1
            end
        else # caso não estivermos, chamamos o próximo leyer, depois de verificar se passamos do NumObjetivo
            if sum(push!(copy(CombinandoCopy), ListNumDesBloq[CheckPoint])) > NumObjetivo
                break
            end
            # criamos uma cópia da lista dos números combinados por esse e pelos leyers superiores
            # para ser usada no inferior sem altera-la.
            CombinandoMeio = copy(CombinandoCopy)
            # Adicionando a ela o próximo número que será combinado pelos leyers inferiores 
            push!(CombinandoMeio, ListNumDesBloq[CheckPoint])
            # Avisamos o programa que passamos para o próximo número a ser combinado
            CheckPoint -= 1
            # E chamamos o leyer inferior a esse.
            CombinaNum(QuantNum, ListNumDesBloq, NumObjetivo, CheckPoint, CombinandoMeio, ListCombinaçãoCorreta)
        end
    end
    # depois de realizar todas as combinações válidas verificamos se encontramos alguma
    if ListCombinaçãoCorreta == Array[]
        return ["Nenhuma Possibilidade Encontrada"]
    end
    # e caso tivermos encontrado, devolvemos os valores encontrados
    return ListCombinaçãoCorreta
end


function VerifComb(Combinado, NumObjetivo)
    if sum(Combinado)::Int == NumObjetivo::Int
        return 1
    elseif sum(Combinado) > NumObjetivo
        return "UltrapassaLimite"
    end
end


"""
Função principal do programa -> acha as outras funções nescessárias
e devolve a lista de possibilidades já classificada
"""
function combinations_in_cage(NumObjetivo,QuantNum, NumBloq = [])
    # criando a lista de opções possíveis
    ListNumDesBloq = RetiraNumBloq(NumBloq)
    return CombinaNum(QuantNum, ListNumDesBloq, NumObjetivo,)
end
