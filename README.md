# Exercícios do site Execism

Este é o projeto em que eu vou realizar todos os  exercícios de julia do site Exercism, assim como, avaliar os resultados obtidos neles, através deste mesmo arquivo readme.

# Versionamento

Além disso, o versionamento será guiado por versões, em que acada nova Major Version significa que um novo exercício foi iniciado. Dessa forma, mesmo que isso não esteja relacionado com a compatibilidade do programa, acredito ser um bom teste para me adaptar as tags.

# Exercícios

## killer-sudoku-helper -- 1.0.0

Meu código ficou muito maior do que a maioria dos outros (acredito que isso seja devido ao fato de que eu não conheço muitas funções ainda), mas o meu código deve ter superado em velocidade a maior parte dos outros. Visto que, essa foi a velocidade em que ele pessou nos testes:

<img src="https://i.ibb.co/zsTXXpW/Teste-do-Killer-Sudoku-Helper.png" alt="Teste-do-Killer-Sudoku-Helper" border="0">

## leap -- 2.2.0

Exercício, que envolve estruturas de decisões (if, elseif e else, mas que só precisa do if), sobre a classificação de um ano ser ou não bisexto. Ademais, é possível resolver ele só com um if, mas apostei em multiplos para ter mais desempenho e isso não afetou o desempenho. Logo, era mais eficiente terminar o exercício com um if e os sinais lógicos: && e ||

<img src="https://i.ibb.co/ctSDKJN/Minha-solu-o.png" alt="Minha-solucao" border="0">

Método otimizado:
```
function is_leap_year(year)
   return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end
```