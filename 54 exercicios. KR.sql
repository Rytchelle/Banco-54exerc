/*1- Quais os países cadastrados?

select * from pais

2- Quantos países estão cadastrados? 

SELECT COUNT(*) AS quantidade_paises 
FROM pais;

3- Quantos países que terminam com a letra "A" estão cadastrados? 

SELECT COUNT(*) AS quantidade_paises 
FROM pais 
WHERE pais LIKE '%A';

4- Listar, sem repetição, os anos que houveram lançamento de filme. 

SELECT DISTINCT YEAR(ano_de_lancamento) AS ano 
FROM filme;

5- Alterar o ano de lançamento (deixar igual a 2007) para filmes que iniciem com a Letra "B". 

select * from filme; 
update filme 
set ano_de_lancamento = 2007 
where titulo like 'B%'

6- Listar os filmes que possuem duração do filme maior que 100 e classificação igual a "G".

select titulo, duracao_do_filme, classificacao 
from filme 
where duracao_do_filme > 100 
and classificacao like 'G'

7- Alterar o ano de lançamento igual 2008 para filmes que possuem duração da locação menor 
que 4 e classificação igual a "PG". 

UPDATE filme 
SET ano_de_lancamento = 2008 
WHERE duracao_da_locacao < 4 
  AND classificacao = 'PG';
  set sql_safe_updates=0;
  
8- Listar a quantidade de filmes que estejam classificados como "PG-13" e preço da locação 
maior que 2.40. 

SELECT COUNT(*) AS quantidade_filmes 
FROM filme 
WHERE classificacao = 'PG-13' 
  AND preco_da_locacao > 2.40;
  
9- Quais os idiomas que possuem filmes cadastrados?

SELECT DISTINCT idioma_id
FROM filme;

COM join

select distinct i.nome as idioma
from filme f
join idioma i on f.idioma_id = i.idioma_id

10-  Alterar o idioma para "GERMAN" dos filmes que possuem preço da locação maior que 4.

select idioma_id, nome 
from idioma 
where nome = 'German'; 
update filme set idioma_id = 6 
where preco_da_locacao > 4

select * from filme;		

11-  Alterar o idioma para "JAPANESE" dos filmes que possuem preço da locação igual 0.99. 

select idioma_id, nome 
from idioma 
where nome = 'Japanese'; 
update filme
 set idioma_id = 3 
 where preco_da_locacao = 0.99

12-  Listar a quantidade de filmes por classificação. 

SELECT classificacao, COUNT(*) AS quantidade_filmes 
FROM filme 
GROUP BY classificacao;


13- Listar, sem repetição, os preços de locação dos filmes cadastrados. 

SELECT DISTINCT preco_da_locacao 
FROM filme;

14-  Listar a quantidade de filmes por preço da locação. 

SELECT preco_da_locacao, COUNT(*) AS quantidade_filmes 
FROM filme 
GROUP BY preco_da_locacao;

15-  Listar os precos da locação que possuam mais de 340 filmes.

SELECT preco_da_locacao 
FROM filme 
GROUP BY preco_da_locacao 
HAVING COUNT(*) > 340;

16- Listar a quantidade de atores por filme ordenando por quantidade de atores crescente. 

select filme_id, count(ator_id) as atores 
from filme_ator 
group by filme_id 
order by atores asc

com JOin

select count(a.ator_id), f.titulo from ator a
join filme_ator fa on a.ator_id = fa.ator_id
join filme f on f.filme_id = fa.filme_id
group by titulo
order by 2 asc;

17- Listar a quantidade de atores para os filmes que possuem mais de 5 atores ordenando por 
quantidade de atores decrescente.

select filme_id, count(ator_id) as quantidade_ator 
from filme_ator 
group by filme_id 
order by filme_id desc;

18- Listar o título e a quantidade de atores para os filmes que possuem o idioma "JAPANESE" 
e mais de 10 atores ordenando por ordem alfabética de título e ordem crescente de quantidade de atores.

select filme_id, count(ator_id) as quantidade_ator
from filme_ator 
group by filme_id 
having quantidade_ator > 5 order by quantidade_ator desc;

com JOIN

select fa.filme_id, count(ator_id) as atores, titulos
from filme ator fa,
join filme f on fa.filme_id = f.filme_id
join idioma i on f.idioma_id = i.idioma_id and i.idioma_id = 3
group by fa.filme_id, titulo
having atores > 10 
order by titulo;

19-  Qual a maior duração da locação dentre os filmes? 

select f.titulo, fa.filme_id, count(ator_id) as quantidade_de_atores from idioma i, filme f, filme_ator fa
where f.filme_id = fa.filme_id and f.idioma_id = 3
group by fa.filme_id having count(fa.ator_id) > 10
order by quantidade_de_atores desc;

select * from idioma;

20-  Quantos filmes possuem a maior duração de locação? 

select count(duracao_da_locacao) 
from filme 
where idioma_id = 3 or idioma_id = 6
and duracao_da_locacao = 7

21-  Quantos filmes do idioma "JAPANESE" ou "GERMAN" possuem a maior duração de 
locação?

select classificacao, preco_da_locacao, count(*) as Filme
from filme
group by classificacao, preco_da_locacao;

22-  Qual a quantidade de filmes por classificação e preço da locação? 

select max(duracao_da_locacao), categoria_id from filme_categoria, filme
group by categoria_id;

23-  Qual o maior tempo de duração de filme por categoria?

select classificacao, count(*) as Filme
from filme
group by classificacao

24- Listar a quantidade de filmes por categoria. 

SELECT classificacao, COUNT(*) AS Quantidade_Filmes
FROM filme
WHERE classificacao = 'G'
GROUP BY classificacao;

25-  Listar a quantidade de filmes classificados como "G" por categoria. 

select count(f.titulo), c.nome from filme as f, categoria c, filme_categoria fc
where f.classificacao ='G' and f.filme_id = fc.filme_id 
and fc.categoria_id = c.categoria_id
group by c.categoria_id

26-  Listar a quantidade de filmes classificados como "G" OU "PG" por categoria.

select count(filme.titulo), categoria.nome from filme, categoria, filme_categoria
where (filme.classificacao = 'G' or filme.classificacao='PG') and filme.filme_id = filme
and filme_categoria.categoria_id = categoria.categoria_id
group by caegoria.categoria_id

27-  Listar a quantidade de filmes por categoria e classificação.

select count(filme.titulo), categoria.nome , filme.classificacao from filme, categoria, filme_categoria
where filme.filme_id = filme_categoria.filme_id
and filme_categoria.categoria_id = categoria.categoria_id
group by categoria.categoria_id, filme.classificacao

28- Qual a quantidade de filmes por Ator ordenando decrescente por quantidade?

select count(f.filme_id), fa.ator_id from filme f, ator a, filme_ator fa
where f.filme_id = fa.filme_id
and a.ator_id = fa.ator_id
group by fa.filme_id
order by count(f.filme_id) desc;

29- Qual a quantidade de filmes por ano de lançamento ordenando por quantidade crescente? 

SELECT ano_de_lancamento, COUNT(filme_id) AS quantidade_filmes
FROM filme
GROUP BY ano_de_lancamento

30- Listar os anos de lançamento que possuem mais de 400 filmes?

SELECT ano_de_lancamento, COUNT(*) AS quantidade_filmes
FROM filme
GROUP BY ano_de_lancamento
HAVING COUNT(*) > 400
ORDER BY quantidade_filmes DESC;

31-  Listar os anos de lançamento dos filmes que possuem mais de 100 filmes com preço da 
locação maior que a média do preço da locação dos filmes da categoria "Children"? 

select ano_de_lancamento, count(titulo)
from filme f, filme_categoria fc
where preco_da_locacao > 2.98 and f.filme_id = fc.filme_id
and categoria_id = 3 
group by ano_de_lancamento
having count(titulo) > 100

32- Quais as cidades e seu pais correspondente que pertencem a um país que inicie com a 

select cidade, pais from cidade c, pais p
where c.pais_id = p.pais_id
AND pais like 'A%'
group by pais;


33-  Qual a quantidade de cidades por pais em ordem decrescente?

select count(cidade), pais 
from cidade c, pais p 
where p.pais_id = c.pais_id
group by p.pais
order by 1 desc;


34-  Qual a quantidade de cidades que iniciam com a Letra “A” por pais em ordem crescente? 

select count(cidade), p.pais 
from cidade c, pais p
where p.pais_id = c.pais_id
AND pais like 'A%'
group by p.pais
order by p.pais asc;

35-  Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A”? 

select pais, cidade 
from cidade c, pais p
where p.pais_id = c.pais_id
AND pais like 'A%'
group by p.pais
having count(cidade_id) > 3;


36-  Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A” ou tenha "R" 

select pais, cidade 
from cidade c, pais p
where p.pais_id = c.pais_id
AND (cidade like 'A%'
or cidade like '%R%')
group by p.pais
having count(cidade_id) > 3;


37-  Quais os clientes moram no país “United States”? 

select primeiro_nome, pais
from cliente c, pais p, endereco e, cidade cdd
where c.endereco_id = e.endereco_id
and e.cidade_id = cdd.cidade_id
and cdd.pais_id = p.pais_id
and pais = "United States";


38-  Quantos clientes moram no país “Brazil”?

select count(primeiro_nome), pais
from cliente c, pais p, endereco e, cidade cdd
where c.endereco_id = e.endereco_id
and e.cidade_id = cdd.cidade_id
and cdd.pais_id = p.pais_id
and pais = "Brazil";

39- Qual a quantidade de clientes por pais? 

select count(primeiro_nome), pais
from cliente c, pais p, endereco e, cidade cdd
where c.endereco_id = e.endereco_id
and e.cidade_id = cdd.cidade_id
and cdd.pais_id = p.pais_id
group by pais


40- Quais países possuem mais de 10 clientes?

select count(primeiro_nome), pais
from cliente c, pais p, endereco e, cidade cdd
where c.endereco_id = e.endereco_id
and e.cidade_id = cdd.cidade_id
and cdd.pais_id = p.pais_id
group by pais
Having count(primeiro_nome) >= 10


41-  Qual a média de duração dos filmes por idioma? 

select avg(duracao_do_filme), nome
from filme f, idioma i
where f.idioma_id = i.idioma_id
group by nome;


42-  Qual a quantidade de atores que atuaram nos filmes do idioma “English”?

SELECT COUNT(ator_id) AS total_atores, titulo
FROM filme_ator c, filme p, idioma l
where c.filme_id = p.filme_id and l.idioma_id = p.idioma_id and nome = 'English'
group by titulo



# WHERE idioma_id = (SELECT idioma_id FROM idioma WHERE nome = 'English');

43- Quais os atores do filme “BLANKET BEVERLY”?

SELECT primeiro_nome, ultimo_nome from ator a, filme f, filme_ator fa
where titulo="blanket beverly" and f.filme_id = fa.filme_id and a.ator_id=fa.ator_id

44- Quais categorias possuem mais de 60 filmes cadastrados?

SELECT count(titulo) , c.nome
FROM categoria c,filme_categoria fc, filme f
WHERE c.categoria_id = fc.categoria_id and f.filme_id = fc.filme_id
group by c.nome
having count(titulo) > 60

45-  Quais os filmes alugados (sem repetição) para clientes que moram na “Argentina”? 

SELECT DISTINCT f.titulo
FROM filme f, inventario i, aluguel a, cliente c, endereco e, cidade ci, pais p
WHERE f.filme_id = i.filme_id
  AND i.inventario_id = a.inventario_id
  AND a.cliente_id = c.cliente_id
  AND c.endereco_id = e.endereco_id
  AND e.cidade_id = ci.cidade_id
  AND ci.pais_id = p.pais_id
  AND p.pais = 'Argentina';
  
46-  Qual a quantidade de filmes alugados por Clientes que moram na “Chile”?

SELECT COUNT(*) AS quantidade_alugueis
FROM cliente c, endereco e, cidade ci, pais p, aluguel a, inventario i, filme f
WHERE c.endereco_id = e.endereco_id
  AND e.cidade_id = ci.cidade_id
  AND ci.pais_id = p.pais_id
  AND p.pais = 'Chile'
  AND c.cliente_id = a.cliente_id
  AND a.inventario_id = i.inventario_id
  AND i.filme_id = f.filme_id;
  
47-  Qual a quantidade de filmes alugados por funcionário?

SELECT a.funcionario_id, COUNT(*) AS quantidade_alugueis
FROM aluguel a
GROUP BY a.funcionario_id;

48-  Qual a quantidade de filmes alugados por funcionário para cada categoria?

SELECT a.funcionario_id, fc.categoria_id, COUNT(*) AS quantidade_alugueis
FROM aluguel a, inventario i, filme_categoria fc
WHERE a.inventario_id = i.inventario_id
  AND i.filme_id = fc.filme_id
GROUP BY a.funcionario_id, fc.categoria_id;

49-  Quais Filmes possuem preço da Locação maior que a média de preço da locação?

SELECT f.titulo
FROM filme f
WHERE f.preco_da_locacao > (SELECT AVG(preco_da_locacao) FROM filme);

50-  Qual a soma da duração dos Filmes por categoria? 

SELECT c.categoria_id, SUM(f.duracao_do_filme) AS soma_duracao
FROM filme f, filme_categoria fc, categoria c
WHERE f.filme_id = fc.filme_id
  AND fc.categoria_id = c.categoria_id
GROUP BY c.categoria_id;

51- Qual a quantidade de filmes locados mês a mês por ano?  

SELECT YEAR(a.data_de_aluguel) AS ano,
       MONTH(a.data_de_aluguel) AS mes,
       COUNT(*) AS quantidade_filmes_locados
FROM aluguel a
GROUP BY ano, mes
ORDER BY ano, mes;

52-  Qual o total pago por classificação de filmes alugados no ano de 2006?

SELECT f.classificacao,
       SUM(p.valor) AS total_pago
FROM filme f, aluguel a, pagamento p, inventario i
WHERE a.inventario_id = i.inventario_id
  AND i.filme_id = f.filme_id
  AND a.aluguel_id = p.aluguel_id
  AND YEAR(a.data_de_aluguel) = 2006
GROUP BY f.classificacao;

53- Qual a média mensal do valor pago por filmes alugados no ano de 2005?

SELECT MONTH(a.data_de_aluguel) AS mes,
       AVG(p.valor) AS media_valor_pago
FROM filme f, inventario i, aluguel a, pagamento p
WHERE f.filme_id = i.filme_id
  AND i.inventario_id = a.inventario_id
  AND a.aluguel_id = p.aluguel_id
  AND YEAR(a.data_de_aluguel) = 2005
GROUP BY MONTH(a.data_de_aluguel);

54- Qual o total pago por filme alugado no mês de Junho de 2006 por cliente?

SELECT c.cliente_id,
       SUM(p.valor) AS total_pago
FROM cliente c, aluguel a, pagamento p, inventario i, filme f
WHERE a.cliente_id = c.cliente_id
  AND a.aluguel_id = p.aluguel_id
  AND a.inventario_id = i.inventario_id
  AND i.filme_id = f.filme_id
  AND MONTH(a.data_de_aluguel) = 6
  AND YEAR(a.data_de_aluguel) = 2006
GROUP BY c.cliente_id; */ 