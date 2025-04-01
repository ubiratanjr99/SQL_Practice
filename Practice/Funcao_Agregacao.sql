/* 1. A equipe financeira deseja realizar um levantamento do total de valores concedidos em empréstimos. 
Esses dados são essenciais para analisar o impacto financeiro da instituição e traçar estratégias para novos produtos de crédito.

Qual é o total de valores concedidos em empréstimos até o momento? */

SELECT SUM(Valor) AS [Total Emprestimos]
FROM TabelaEmprestimo;

/* 2. O setor financeiro precisa determinar a média salarial dos colaboradores para planejar reajustes, benefícios e futuros investimentos em folha de pagamento.

Qual é a média salarial dos colaboradores da empresa? */

SELECT CAST(AVG(Salario) AS DECIMAL(38,2)) AS [Média Salarial]
FROM TabelaColaboradores

/* 3. A equipe de crédito deseja saber qual foi o maior valor de empréstimo concedido até o momento, 
a fim de compreender os limites aprovados e identificar possíveis ajustes na política de crédito.

Qual é o maior valor de empréstimo concedido pela instituição? */

SELECT MAX(Valor) AS [Maior Empréstimo]
FROM TabelaEmprestimo;

/* 4. O time de análise de risco quer entender qual foi o menor valor de empréstimo concedido para avaliar se é viável 
oferecer valores ainda menores para um novo produto de microcrédito.

Qual é o menor valor de empréstimo já concedido? */

SELECT MIN(Valor) AS [Menor Empréstimo]
FROM TabelaEmprestimo;

/* 5. O setor de Recursos Humanos precisa saber quantos colaboradores estão ativos no sistema para 
controle de headcount e planejamento de contratações futuras.

Quantos colaboradores estão registrados na empresa atualmente?*/
 
SELECT COUNT(*) AS [Total de Colaboradores]
FROM TabelaColaboradores;

/* 6. A equipe de análise financeira deseja verificar se a média dos valores de empréstimos pode ser calculada corretamente manualmente, 
comparando o total concedido com o número de empréstimos aprovados.

Qual é a média dos valores de empréstimos concedidos usando a soma total dividida pela quantidade de empréstimos?*/

SELECT CAST(SUM(Valor)/COUNT(id_emprestimo) AS DECIMAL(38,2)) AS [Média Empréstimos]
FROM TabelaEmprestimo;

/* 7. O gerente de TI quer entender melhor como os salários estão distribuídos entre os diferentes departamentos 
para avaliar os custos operacionais e tomar decisões estratégicas sobre alocações de orçamento.

Qual é o total de salários pagos por departamento?*/

SELECT	D.id_departamento,
		SUM(C.Salario) AS [Total Salários]
FROM TabelaDepartamento D
INNER JOIN TabelaColaboradores C
ON D.id_departamento = C.id_departamento
GROUP BY D.id_departamento;

/* 8. A equipe de vendas deseja saber quais categorias de empréstimos ultrapassaram R$ 20.000 em valor total concedido, 
para identificar quais linhas de crédito são mais populares e rentáveis.

Quais categorias de empréstimos possuem um total concedido superior a R$ 20.000?*/

SELECT	Tipo,	
		SUM(Valor) AS [Total Concedido]
FROM TabelaEmprestimo
GROUP BY Tipo
HAVING SUM(Valor) > 20000;

/* 9. O time de vendas deseja compreender melhor a distribuição dos valores emprestados e a quantidade de contratos firmados 
para cada tipo de empréstimo. Essa análise permitirá identificar quais modalidades são mais procuradas pelos clientes e 
quais apresentam maior retorno financeiro para a instituição.

Qual é o total de valores concedidos e a quantidade de empréstimos firmados por tipo de empréstimo?*/

SELECT	Tipo,
		SUM(Valor) AS [Valor Total Concedido],
		COUNT(Tipo) AS [Empréstimos Firmados]
FROM TabelaEmprestimo
GROUP BY Tipo;

/* 10. A equipe de análise financeira precisa de uma visão consolidada dos empréstimos concedidos para reportar os resultados à diretoria. 
Para isso, será necessário calcular indicadores como o total concedido, a média dos valores, além do maior e menor valor emprestado, 
consolidando essas informações em uma única consulta.

Qual é o total, a média, o maior e o menor valor dos empréstimos concedidos?*/

SELECT	SUM(Valor) AS Total,
		AVG(Valor) AS Média,
		MAX(Valor) AS [Valor Máximo],
		MIN(Valor) AS [Valor Mínimo]
FROM TabelaEmprestimo;