/*
1. A empresa DataFinance est� desenvolvendo relat�rios detalhados para an�lise de sua base de clientes. 
Um dos requisitos � padronizar os nomes dos clientes em letras mai�sculas, facilitando a leitura e evitando inconsist�ncias 
em documentos oficiais.
Sua miss�o � criar uma consulta SQL que atenda a essa necessidade, garantindo que os relat�rios sejam exibidos no formato padronizado.

Com base nesse requisito, escreva uma consulta SQL que exiba todos os nomes dos clientes no formato padronizado em mai�sculas.
*/
SELECT UPPER(Nome) AS [Nome Maiusculo]
FROM TabelaClientes

----------------------------------------------------------------------------------------------------------------------------------

/*
2. A equipe de TI da DataFinance est� automatizando notifica��es internas para os colaboradores. 
Durante os testes, foi identificado que o sistema de envio requer que os nomes dos colaboradores estejam em letras min�sculas 
para evitar problemas de compatibilidade.
Essa limita��o exige que voc� ajuste os dados diretamente no banco de dados para garantir que todos os nomes sigam esse padr�o.

Que consulta voc� utilizaria para converter os nomes dos colaboradores em letras min�sculas?
*/
SELECT LOWER(NomeColaborador) AS [Nome Minusculo]
FROM TabelaColaboradores

----------------------------------------------------------------------------------------------------------------------------------

/*
3. Voc� est� criando um sistema para gerar c�digos personalizados de identifica��o de clientes. 
Esses c�digos ser�o usados em contratos de empr�stimos e outras intera��es com o banco. 
Eles precisam ser baseados nos tr�s primeiros caracteres do nome e CPF do cliente, garantindo unicidade.

Como voc� criaria uma consulta SQL para extrair os tr�s primeiros caracteres do nome e CPF de cada cliente 
para formar um identificador �nico?
*/
SELECT CONCAT(SUBSTRING(Nome, 1, 3), SUBSTRING(CPF, 1, 3)) AS Identificador
FROM TabelaClientes

----------------------------------------------------------------------------------------------------------------------------------

/*
4. Durante a valida��o de cadastros de clientes, foi identificado que alguns nomes est�o muito curtos ou longos, 
o que pode causar problemas nos contratos ou nos sistemas integrados. 
O setor de qualidade solicitou uma an�lise que mostrasse o nome do cliente e o comprimento de cada registro.

Qual seria uma abordagem para criar uma consulta que retorne os nomes dos clientes e o n�mero de caracteres de cada um?
*/
SELECT	Nome,
		LEN(Nome) AS Comprimento
FROM TabelaClientes

----------------------------------------------------------------------------------------------------------------------------------

/*
5. A lideran�a da DataFinance solicitou um relat�rio detalhado dos respons�veis pelos departamentos da empresa. 
Atualmente, os dados est�o separados, mas o setor de Recursos Humanos precisa exibir o nome completo do colaborador, 
seguido de seu cargo no departamento, em uma �nica coluna.

Que consulta SQL poderia ser criada para apresentar essas informa��es de maneira clara e organizada?
*/
SELECT CONCAT(NomeColaborador, ' - ', Cargo) AS [Nome & Cargo]
FROM TabelaColaboradores

----------------------------------------------------------------------------------------------------------------------------------

/*
6. A tarefa de revisar os relat�rios internos da DataFinance faz parte de uma atualiza��o nos processos de gest�o. 
Durante uma reuni�o, foi decidido que os nomes dos departamentos precisam ser simplificados para melhorar a clareza nos relat�rios. 
Um exemplo dessa mudan�a � o setor de "Recursos Humanos", que passar� a ser exibido como "RH".

Que consulta SQL poderia ser utilizada para ajustar os nomes exibidos, substituindo "Recursos Humanos" por "RH"?
*/
SELECT REPLACE(NomeDepartamento, 'Recursos Humanos', 'RH') AS [Nome Atualizado]
FROM TabelaDepartamento

/*
7. Neste desafio, voc� ir� aprimorar a apresenta��o dos dados de empr�stimos para facilitar a leitura e a interpreta��o r�pida 
das informa��es essenciais. Usando fun��es de manipula��o de strings e formata��o num�rica no SQL, 
voc� criar� uma descri��o formatada para cada empr�stimo listado na tabela Empr�stimo.

O objetivo � combinar as informa��es de tipo, status e valor do empr�stimo em uma �nica string formatada que seja clara, 
informativa e est�ticamente agrad�vel.
*/
SELECT CONCAT(TRIM(Tipo), ' - ', Status, ' - ', '$', Valor) AS [Descricao do Emprestimo]
FROM TabelaEmprestimo

/*
8. A organiza��o dos registros de pagamentos est� sendo aprimorada pela equipe financeira para tornar o sistema mais eficiente. 
Para melhorar a visualiza��o e facilitar consultas, foi solicitado que cada pagamento receba um identificador �nico baseado no status 
e no ID do pagamento. Por exemplo, pagamentos com status "Pago" podem gerar identificadores como "PagP01".

Qual consulta SQL poderia ser usada para gerar um identificador �nico para cada pagamento, exibindo o status e o ID do pagamento concatenados?
*/
SELECT	id_pagamento,
		CONCAT(SUBSTRING(Status, 1, 3), id_pagamento) AS [Identificador do Pagamento]
FROM TabelaPagamentos

/*
9. O setor de an�lise de cr�dito precisa padronizar os relat�rios utilizados em apresenta��es para investidores. 
Um problema identificado foi a inconsist�ncia nas fontes de consulta do score de cr�dito, onde algumas aparecem com nomes longos, 
como "Boa Vista", enquanto outras s�o abreviadas, como "SPC".

Para garantir que todos os dados estejam uniformes, � necess�rio padronizar as fontes. 
O nome "Serasa" deve ser convertido para "SER", "SPC" permanece como est�, e "Boa Vista" deve ser abreviado para "BOA".

Como voc� criaria uma consulta para gerar as abrevia��es padronizadas das fontes de consulta do score de cr�dito?
*/
SELECT	id_score,
		Fonte,
		REPLACE(REPLACE(Fonte, 'Serasa', 'SER'), 'Boa Vista', 'BOA') AS [Fonte Abreviada]
FROM TabelaScoreCredito

/*
10. Durante uma auditoria, o setor financeiro identificou inconsist�ncias nos registros de tipos de empr�stimos. 
Alguns registros possuem espa�os extras no in�cio ou no final dos valores, o que est� causando problemas em relat�rios e sistemas integrados.

Sua miss�o � corrigir essas inconsist�ncias, removendo os espa�os extras nos valores da coluna Tipo.

Qual consulta voc� utilizaria para exibir os tipos de empr�stimos j� padronizados?
*/
SELECT	id_emprestimo,
		TRIM(Tipo) AS Tipo
FROM TabelaEmprestimo