/* 1. A equipe financeira deseja realizar um levantamento do total de valores concedidos em empr�stimos. 
Esses dados s�o essenciais para analisar o impacto financeiro da institui��o e tra�ar estrat�gias para novos produtos de cr�dito.

Qual � o total de valores concedidos em empr�stimos at� o momento? */

SELECT SUM(Valor) AS [Total Emprestimos]
FROM TabelaEmprestimo;

/* 2. O setor financeiro precisa determinar a m�dia salarial dos colaboradores para planejar reajustes, benef�cios e futuros investimentos em folha de pagamento.

Qual � a m�dia salarial dos colaboradores da empresa? */

SELECT CAST(AVG(Salario) AS DECIMAL(38,2)) AS [M�dia Salarial]
FROM TabelaColaboradores

/* 3. A equipe de cr�dito deseja saber qual foi o maior valor de empr�stimo concedido at� o momento, 
a fim de compreender os limites aprovados e identificar poss�veis ajustes na pol�tica de cr�dito.

Qual � o maior valor de empr�stimo concedido pela institui��o? */

SELECT MAX(Valor) AS [Maior Empr�stimo]
FROM TabelaEmprestimo;

/* 4. O time de an�lise de risco quer entender qual foi o menor valor de empr�stimo concedido para avaliar se � vi�vel 
oferecer valores ainda menores para um novo produto de microcr�dito.

Qual � o menor valor de empr�stimo j� concedido? */

SELECT MIN(Valor) AS [Menor Empr�stimo]
FROM TabelaEmprestimo;

/* 5. O setor de Recursos Humanos precisa saber quantos colaboradores est�o ativos no sistema para 
controle de headcount e planejamento de contrata��es futuras.

Quantos colaboradores est�o registrados na empresa atualmente?*/
 
SELECT COUNT(*) AS [Total de Colaboradores]
FROM TabelaColaboradores;

/* 6. A equipe de an�lise financeira deseja verificar se a m�dia dos valores de empr�stimos pode ser calculada corretamente manualmente, 
comparando o total concedido com o n�mero de empr�stimos aprovados.

Qual � a m�dia dos valores de empr�stimos concedidos usando a soma total dividida pela quantidade de empr�stimos?*/

SELECT CAST(SUM(Valor)/COUNT(id_emprestimo) AS DECIMAL(38,2)) AS [M�dia Empr�stimos]
FROM TabelaEmprestimo;

/* 7. O gerente de TI quer entender melhor como os sal�rios est�o distribu�dos entre os diferentes departamentos 
para avaliar os custos operacionais e tomar decis�es estrat�gicas sobre aloca��es de or�amento.

Qual � o total de sal�rios pagos por departamento?*/

SELECT	D.id_departamento,
		SUM(C.Salario) AS [Total Sal�rios]
FROM TabelaDepartamento D
INNER JOIN TabelaColaboradores C
ON D.id_departamento = C.id_departamento
GROUP BY D.id_departamento;

/* 8. A equipe de vendas deseja saber quais categorias de empr�stimos ultrapassaram R$ 20.000 em valor total concedido, 
para identificar quais linhas de cr�dito s�o mais populares e rent�veis.

Quais categorias de empr�stimos possuem um total concedido superior a R$ 20.000?*/

SELECT	Tipo,	
		SUM(Valor) AS [Total Concedido]
FROM TabelaEmprestimo
GROUP BY Tipo
HAVING SUM(Valor) > 20000;

/* 9. O time de vendas deseja compreender melhor a distribui��o dos valores emprestados e a quantidade de contratos firmados 
para cada tipo de empr�stimo. Essa an�lise permitir� identificar quais modalidades s�o mais procuradas pelos clientes e 
quais apresentam maior retorno financeiro para a institui��o.

Qual � o total de valores concedidos e a quantidade de empr�stimos firmados por tipo de empr�stimo?*/

SELECT	Tipo,
		SUM(Valor) AS [Valor Total Concedido],
		COUNT(Tipo) AS [Empr�stimos Firmados]
FROM TabelaEmprestimo
GROUP BY Tipo;

/* 10. A equipe de an�lise financeira precisa de uma vis�o consolidada dos empr�stimos concedidos para reportar os resultados � diretoria. 
Para isso, ser� necess�rio calcular indicadores como o total concedido, a m�dia dos valores, al�m do maior e menor valor emprestado, 
consolidando essas informa��es em uma �nica consulta.

Qual � o total, a m�dia, o maior e o menor valor dos empr�stimos concedidos?*/

SELECT	SUM(Valor) AS Total,
		AVG(Valor) AS M�dia,
		MAX(Valor) AS [Valor M�ximo],
		MIN(Valor) AS [Valor M�nimo]
FROM TabelaEmprestimo;