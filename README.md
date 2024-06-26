# Exercícios do site Exercism

Este é o projeto em que eu vou realizar todos os  exercícios de julia do site Exercism, assim como, avaliar os resultados obtidos neles, através deste mesmo arquivo readme.

# Versionamento

Além disso, o versionamento será guiado por versões, em que acada nova Major Version significa que um novo exercício foi iniciado. Dessa forma, mesmo que isso não esteja relacionado com a compatibilidade do programa, acredito ser um bom teste para me adaptar as tags.

# Exercícios

## killer-sudoku-helper -- 1.0.0

Meu código ficou muito maior do que a maioria dos outros (acredito que isso seja devido ao fato de que eu não conheço muitas funções ainda), mas o meu código deve ter superado em velocidade a maior parte dos outros. Visto que, essa foi a velocidade em que ele pessou nos testes:

<img src="https://i.ibb.co/zsTXXpW/Teste-do-Killer-Sudoku-Helper.png" alt="Teste-do-Killer-Sudoku-Helper" border="0">

## leap -- 2.2.0

Exercício, que envolve estruturas de decisões (if, elseif e else, mesmo que só precise do if), sobre a classificação de um ano ser ou não bisexto. Ademais, é possível resolver ele só com um if, mas apostei em multiplos para ter mais desempenho e isso não afetou o desempenho. Logo, era mais eficiente terminar o exercício com um if e os sinais lógicos: && e ||

<img src="https://i.ibb.co/ctSDKJN/Minha-solu-o.png" alt="Minha-solucao" border="0">

Método otimizado:
```
function is_leap_year(year)
   return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end
```
## nucleotide-count -- 3.3

Exercício, fácil, em que você tem que contar quantas vezes certos caracteres se repetem em uma string, ao mesmo tempo que verifica se elas são válidas e retornar um erro caso não sejam.
<div>
Além disso, minha solução passa por cada letra da string enquanto tenta adicionar a contagem de cada letra no dicionário a medida em que vai encontrando elas e verificando se elas são válidas através de estruturas de decisões. Porém, este não é o método mais eficiente, pois eu poderia usar a função try e cached para retornar um erro em caso de uma letra inválida.
</div>

## pangram -- 4.3

Exercício fácil, no qual se tem que verificar se todas as letras do alfabeto estão contidas em uma frase. Exemplo de pangrama sem acento: `Quem traz CD, LP, fax, engov e whisky JB?`

<div>
Paralelamente, ele pode ser resolvido através de uma simples linha de código: 
</div>

```
function ispangram(input)
    'a':'z' ⊆ lowercase(input)
end
```

Porém, devido ao meu desconhecimento des funções utilizadas, eu basicamente fiz a minha solução aplicando diversas outras e, assim, ela ficou bem maior (55 linhas contra 10), mesmo que tão rápida quanto a solução acima. Visto que, ela executou todos os teste em menos de 0.0 segundos e em 0.2 no primeiro o que é o mesmo resultado da solução acima:

<img src="https://i.ibb.co/JFTvZvJ/image.png" alt="image" border="0">

## rotational-cipher 5.1.2

Exercicio interessante, no qual pensei em várias soluções cada qual com seus ponto negativo e positivo:

1. **Criar a lista rotacionada e compara-la com o alfabeto normal**. Porém, devido a nescessidade constante de procurar as letras no alfabeto normal, essa solução não seria a mais eficiente, ainda que, a pesquisa binária fosse aplicada (suponho);

2. Pré criar todas as possibilidades de rotação do alfabeto. No entanto, isso não resolveria o problema da solução anterior e não seria uma forma elegante de resolver o problema; e

3. Calcular a possível posição das letras apartir de formulas matemáticas e do própio código ASCII da letra. Apesar de que, o mesmo processo de calculo seja repetido para cada letra, imagino que esta seja uma das soluções mais eficientes, pois o calculo usaria menos processamento do que a procura pelas letras na lista do alfabeto.

#### Minha Solução

A minha solução ficou na média em 0.2 no primeiro e entre 0.1 e 0.2 no segundo. Enquanto que na média as outras soluções ficaram entre 0.3 e 0.2 no primeiro e em 0.2 no segundo. Isso, é claro, na minha máquina.

<a href="https://ibb.co/SxxDVtr"><img src="https://i.ibb.co/KGGcV2w/image.png" alt="image" border="0"></a> <br>
Meu resultado.

#### Problemas Bônus

Primeiramente, passei um dia tentando desobrir como resolver esse problema, mas no final só consigui resolver o bônus A. Já que, ainda sou iniciante (logo tenho dificuldades de olhar na documentação, que está em inglês, no qual não sou tão bom ainda), como também, existem poucos materiais de ensino gratuitos da linguagem Julia.

Apesar dos contra tempos, consegui entender melhor algumas coisas sobre macros na linguagem Julia e eval's, embora só tenha aplicado a macro.

## difference-of-squares 6.0.1

Exercício fácil feito para explorar sintex de julia enquanto à multiplicação de matrizes por números apenas colocando um ponto na frente do símbulo da operação.