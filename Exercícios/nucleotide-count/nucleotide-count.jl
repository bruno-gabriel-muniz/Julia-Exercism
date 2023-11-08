"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    # Criamos um dicionário que ira conter
    # o nome e as quantidades de nucleutideos
    DictNucleotideos = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    # passamos por todas as letras da entrada
    for letra in strand
        # verificamos qual nucleotideo é
        if letra == 'A'
            # e adicionamos ao correto
            DictNucleotideos['A'] += 1
        elseif letra == 'C'
            DictNucleotideos['C'] += 1
        elseif letra == 'G'
            DictNucleotideos['G'] += 1
        elseif letra == 'T'
            DictNucleotideos['T'] += 1
        # caso não seja nenhum tipo de nucleotídeo
        else
            # retornamos o erro de entrada
            return throw(DomainError(1,"O Valor $letra é Invalido"))
        end
    end
    # e por fim retornamos retornamos os valores encontrados
    # caso não tenha ocorrido nenhum erro
    return DictNucleotideos
end

