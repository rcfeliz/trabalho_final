
<!-- README.md is generated from README.Rmd. Please edit that file -->

# E se eu tivesse feito animação?

## Introdução

Quando eu era pequeno, eu dizia que queria fazer cinema. Nessa área,
acima de tudo, eu gostava eram das animações. Me lembro do meu
encantamento de criança com os filmes do Studio Ghibli, das aventuras
que eu tinha com Totoro e Nausicaa, com Chihiro e Mononoke. Eu sonhava
com aqueles mundos fantásticos, cheios de cores e de esperança. A partir
desses filmes, surgiu em mim o sonho de ser um animador O que a minha
criança desejava era criar estórias fantásticas que conquistassem
públicos e ajudassem as pessoas a sonhar.

Mas meus pais não facilitaram essa decisão. Logo me podaram as asas,
disseram que animação não era pra mim (em parte, eles tinham razão, pois
sempre fui um péssimo desenhista, e sou até hoje). Mas no fim, acabei
desistindo de cinema mesmo; ver filmes e animações acabou se ganhou o
espaço de hobby apenas. Pensei depois em fazer Letras, Psicologia ou
Jornalismo. Acabei no Direito.

Mas desde então ficou uma curiosidade em mim: que futuro me aguardava se
eu tivesse optado por fazer cinema, anos atrás? O que aconteceria se eu
fosse para o ramo da animação? Assim, o que eu desejo fazer neste
trabalho é olhar para o mercado de animações, em comparação com o
mercado de filmes (aqui vou adotar essa nomenclatura de “filmes” para
designar tudo que não é animação, apesar de que animações também podem
ser filmes).

Para realilzar este trabalho, vou me valer da base de dados do IMDB.
Essa base contém 3713 linhas por 15 colunas, em que cada linha é um
filme diferente, e cada coluna é uma variável deste filme. As variáveis
que mais me interessam aqui são: gênero do filme, ano, orçamento,
receita e nota no imdb.

## Animações contra filmes

Para conseguir comparar melhor as animações, criei uma variável dummy,
chamada “animacao”. Ao todo, observamos que há apenas 180 animações
nesta base, de um total de 3700 filmes.

O que eu quero ver, em geral, é o que dá “mais certo”: filmes ou
animações? O primeiro passo para isso é definir o que é “dar certo”. A
medida que vou adotar aqui para escolher quem é pior ou melhor, vão ser
duas: o faturamento de cada filme e a avaliação deles.

O faturamento eu calculei pela diferença aritmética entre a receita e o
orçamento. Essa medida vai ser utilizada para medir o sucesso dos filmes
pois, pensando no que os meus pais me disseram lá atrás, eles não
acreditavam muito no mercado das aniamções. Então olhar para o
faturamento talvez seja exatamente o olhar que me faltava aos meus 10
anos de idade.

Do outro lado, não basta que a animação seja lucrativa. Ela deve gerar
um público que a cultive, que goste e ame o que eles estão vendo. Daí a
medida das notas do imdb.

Vou começar essas comparações de uma perspectiva histórica. A escolha de
comparar animações e filmes pelo ano de produção se deu porque cada
período na história do cinema tem suas pecualiaridade. E na verdade, a
história da animação é também a história de um desenvolvimento
tecnológico específico. Enquanto os filmes se relacionam ao
desenvolvimento das câmeras, e a técnicas específicas de capturar luz e
movimento e som, as animações se relacionam à história da fotografia, da
digitalização, do desenho e dos softwares de desenho gráfico. Enfim,
começando com essas comparações simples entre as animações e os demais
filmes, observamos os seguintes resultados.

<img src="README_files/figure-gfm/plots-1.png" style="display: block; margin: auto;" />

Quando comparamos animações com filmes, o que chama a atenção é,
primeiro, as altas notas das animações das décadas de 1960 e 1990. Vemos
e cara esses dois picos. As animações de 1965 chegam a uma nota média de
8,4 enquanto as não-animações do mesmo ano ficaram com apenas 7,35
pontos na média. Isso se repete para as animações de 1994, mas nesse ano
a distância fica ainda maior em relação aos filmes, em que as animações
ficaram com 8,5 pontos de avaliação, em média, enquanto as não-animações
com apenas 6,63.

<img src="README_files/figure-gfm/unnamed-chunk-4-1.png" style="display: block; margin: auto;" /><img src="README_files/figure-gfm/unnamed-chunk-4-2.png" style="display: block; margin: auto;" /><img src="README_files/figure-gfm/unnamed-chunk-4-3.png" style="display: block; margin: auto;" />

Agora, comparando financeiramente animações com filmes, observamos que a
década de 1990 apresenta um boom de animações, com uma média de
faturamento, orçamento e de receita muito superiores aos dos filmes. Um
grande orçamento indica muitas pessoas trabalhando em um mesmo projeto,
o que indica muitos profissionais sendo remunerados. Uma grande receita,
indica sucesso de bilheterias e movimentação entorno das produções. Essa
receita, por sua vez, é o que dá conta do orçamento. E o faturamento
indica que as produções de animação não são deficitárias, ou seja, que
os profissionais de fato conseguem ser pagos, e ainda sobra dinheiro ao
final (e não sobra pouco).

Mas…

## Não se deixem enganar

Mas… Esses dados enganam. Eles enganam porque na verdade, os dados
referentes às animações padecem de um grande defeito: a falta de
observações. Por exemplo, quando vemos que a nota do imdb dos filmes de
1994 são, em média 6,63, estamos falando da média entre 44 filmes, em
comparação com a nota de 8,5 de uma única animação\! A seguir temos o
número de animações por ano.

<img src="README_files/figure-gfm/unnamed-chunk-5-1.png" style="display: block; margin: auto;" />

Quando nós olhamos a quantidade de animações a cada ano, vemos que as
quantidades são sempre muito pequenas. 2006 é o primeiro ano em que tem
mais de 10 animações em um único ano. E de qualquer jeito, a maior
quantidade de casos que houve em um ano, foram apenas 13\! Isso
dificulta bastante tirar quaisquer conclusões a respeito do mercado de
animações, porque não estamos diante de grandes números para inferir
algo sobre *as animações* em geral.

Então, por mais sentido que faça dividir as comparações por ano – pois
dessa forma conseguiríamos respeitar a história e o desenvolvimento das
animações – a falta de casos nos dificulta continuarmos com essa
estratégia.

Levantado este problema, é que vou partir para uma análise mais
minuciosa dessas comparações. Vou tentar contornar esse problema de duas
formas distintas: (1) agrupando os períodos em grupos maiores, a fim de
aumentar o número e observações por grupo e (2) analisar globalmente,
sem distinguir por tempo.

### Grupos

A fim de criar grupos maiores, vou agrupar os anos em épocas, ou
períodos. Para não fazer agrupamentos arbitrários, vou seguir os
periodos históricos da história da animação. Os períodos são 6 (apesar
de que o primeiro não será utilizado). Esses periodos refletem a
proposta do historiador italiano Giannalberto Bendazzi, que escreveu
“*Animation: A World History*”, um livro dividido em três volumes. Os
periodos são:

1.  A fundação (0–1908): É o periodo antes da primeira animação a passar
    nas telas de cinema, *Fantasmagorie* de Émile Cohl. Não há nenhum
    filme na base deste periodo, obviamente, pois antes disso, animação
    não existia propriamente.
2.  OS pioneiros (1908–1928): São os primeiros filmes que começam a se
    desenvolver a partir de Fantasmagorie. Aqui, nasce a Disney. Não há
    nenhuma animação na base deste periodo tampouco.
3.  A Era de Ouro (1928–1951): É a época do boom das animações da
    Disney, em que Walt Disney domina a industria e populariza as
    animações nos Estados Unidos. Muito do nosso imaginário sobre o
    mundo das animações está ligado a esta época.
4.  O nascimento de algo novo (1951–1960): Nessa década, a Disney começa
    a perder seu público e sua audiência nos Estados Unidos. Ao mesmo
    tempo, do outro lado do Pacífico, é lançado o primeiro festival de
    animação internacional, na França. Esse é o momento em que a
    animação europeia ganha corpo.  
5.  Os três mercados (1960–1991): Essa década vai até o fim da Guerra
    Fria. Ela é importante porque é nesse momento que surge um terceiro
    mercado de animações, nem americano, nem europeu, mas soviético.
6.  Contemporaneidade (1991–atualmente): Esse periodo começa do fim da
    Guerra Fria. Esse é um fato relevante, porque a partir de então as
    animações soviéticas, que até então ficaram fechadas, começam a se
    disseminar pelo mundo, bem como as animações europeia e americana
    ganham um enorme mercado inédito no Leste Europeu. Nesse periodo
    também é que as animações se encontram com avanços tecnológicos
    incríveis, dando escala para a sua produção. Além disso, é neste
    momento que ocorre o progresso da Asia enquanto produtora de
    animação, e não mais consumidora.

<img src="README_files/figure-gfm/unnamed-chunk-6-1.png" style="display: block; margin: auto;" />

Olhando para a quantidade de filmes por cada periodo, percebemos que os
resultados não melhora muito. Para os “Anos de ouro”, há somente 3
observações\! E para “Os três mercados”, apenas 4. Felizmente, o periodo
de animações contemporâneas ficou bem mais robusto. Ele contabiliza um
total de 169 observações. Como esta alteração criou apenas um grupo em
que as animações pode ser devidamente comparadas com filmes, acredito eu
que não vale a pena realizar essa comparação, pois, na verdade, a
próxima seção irá se dedicar a comparar os dois grupos de forma global.
A diferença de observações entre a comparação das animações no periodo
contemporâneo, com uma comparação que não leva em consideração o ano
daquela película, é de apenas 7 casos.

Isso mostra, na verdade, a dificuldade em se obter informações a
respeito das animações, deixando as análises incertas e tortuosas.
Sigamos para a última comparação.

### Análise global

A última análise que falta é a análise global: e se eu não considerar
nenhum marco temporal, considerar apenas o conjunto?

<img src="README_files/figure-gfm/unnamed-chunk-7-1.png" style="display: block; margin: auto;" />

Quando olhamos para a distribuição e faturamento das animações em
comparação aos filems, vemos que as animações tem em média um
faturamento maior do que os filmes. Essa conclusão passa a ser mais
confiável do que as demais, pois agora estamos olhando para um número
maior de animações (mais especificamente, para o orçamento de 180
animações). Essa informação – de que o faturamento médio das animações
é maior do que o faturamento médio dos filmes – nos dá um pouco mais de
certeza relacionada às conclusões que tiramos nas comparações por ano e
por período. Quando comparamos os filmes e animações ao longo do tempo,
pudemos observar que os orçamentos e receitas das animações eram muito
maiores a partir da década de 1990. Essa conclusão, alertei eu, poderia
estar enviesada, dado o baixo número de observações nos períodos
analisados Entretanto, o que observamos agora é que, ao considerarmos
todas as animações juntos, a tendência de as animações serem mais
lucrativas do que os filmes se mantém.

<img src="README_files/figure-gfm/unnamed-chunk-8-1.png" style="display: block; margin: auto;" />

Já quando comparamos as notas, observamos que, tanto animações como
filmes, são igualmente bem recebidos pelo público. Ambos com uma nota
média por volta de 7. Aqui, pelo menos, não há muita diferença entre
animação ou filmes.

# Conclusões: que futuro me aguardava?

É anedótico que o ramo do cinema que a minha criança gostaria de ter
seguido tenha poucas observações para eu tirar conclusões. A escassez de
observações traz um elemento de insegurança para qualquer análise. E
talvez em grande medida era exatamente essa incerteza a que meus pais me
alertavam, quando ofereciam resistência à minha escolha. O futuro que me
aguardava no ramo da animação era um futuro incerto.

Das poucas conclusões que tiramos, vemos que, em geral, as animações
possuem orçamentos maiores do que os filmes. Isso, talvez, indique que
existem mais profissionais envolvidos na realização de animações e de
que eles sejam mais bem pagos. É difícil comparar o preço de um set de
filmagem, com o preço de softwares de computer graphics. Mas é um
indicativo (e olha a incerteza aqui novamente).

Ao mesmo tempo, a grande desproporção entre animações e filmes (180
animações versus mais de 3500 filmes) também mostra uma dificuldade
desse mercado. Isso indica que as animações são muito menos produzidas
do que os filmes, ou seja, há muito menos projetos em andamento; o que
leva a ter muito menos oportunidades de emprego. Então, novamente, a
incerteza, a insegurança e a ambiguidade aparecem. As animações ao mesmo
tempo envolvem mais profissionais (o que dá mais oportunidades de
trabalho) e possuem uma produção reduzida (o que dá menos oportunidades
de trabalho).

Se esse trabalho surgiu de uma curiosidade pueril, ele se conclui com
muitas incertezas ainda, sem saber ao certo o que me aguardaria se
houvesse escolhido uma carreira em animação. Mas também, não é como se
eu me arrependesse das escolhas que eu fiz. Eu fico na verdade feliz de
ver que as animações estão bem, firmes e fortes no mundo.
