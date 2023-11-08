"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    if verificador strand
        DictNucleotideos = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
        for (NucleotideosName, NumNucleotideos) in DictNucleotideos
            DictNucleotideos[NucleotideosName] = count(NucleotideosName, uppercase(strand))
        end
        return DictNucleotideos
    end
    return DomainError
end
function verificador()
    return true
end
