/*
1. A empresa DataFinance está desenvolvendo relatórios detalhados para análise de sua base de clientes. 
Um dos requisitos é padronizar os nomes dos clientes em letras maiúsculas, facilitando a leitura e evitando inconsistências 
em documentos oficiais.
Sua missão é criar uma consulta SQL que atenda a essa necessidade, garantindo que os relatórios sejam exibidos no formato padronizado.

Com base nesse requisito, escreva uma consulta SQL que exiba todos os nomes dos clientes no formato padronizado em maiúsculas.
*/
SELECT UPPER(Nome) AS [Nome Maiusculo]
FROM TabelaClientes

----------------------------------------------------------------------------------------------------------------------------------

/*
2. A equipe de TI da DataFinance está automatizando notificações internas para os colaboradores. 
Durante os testes, foi identificado que o sistema de envio requer que os nomes dos colaboradores estejam em letras minúsculas 
para evitar problemas de compatibilidade.
Essa limitação exige que você ajuste os dados diretamente no banco de dados para garantir que todos os nomes sigam esse padrão.

Que consulta você utilizaria para converter os nomes dos colaboradores em letras minúsculas?
*/
SELECT LOWER(NomeColaborador) AS [Nome Minusculo]
FROM TabelaColaboradores

----------------------------------------------------------------------------------------------------------------------------------

/*
3. Você está criando um sistema para gerar códigos personalizados de identificação de clientes. 
Esses códigos serão usados em contratos de empréstimos e outras interações com o banco. 
Eles precisam ser baseados nos três primeiros caracteres do nome e CPF do cliente, garantindo unicidade.

Como você criaria uma consulta SQL para extrair os três primeiros caracteres do nome e CPF de cada cliente 
para formar um identificador único?
*/
SELECT CONCAT(SUBSTRING(Nome, 1, 3), SUBSTRING(CPF, 1, 3)) AS Identificador
FROM TabelaClientes

----------------------------------------------------------------------------------------------------------------------------------

/*
4. Durante a validação de cadastros de clientes, foi identificado que alguns nomes estão muito curtos ou longos, 
o que pode causar problemas nos contratos ou nos sistemas integrados. 
O setor de qualidade solicitou uma análise que mostrasse o nome do cliente e o comprimento de cada registro.

Qual seria uma abordagem para criar uma consulta que retorne os nomes dos clientes e o número de caracteres de cada um?
*/
SELECT	Nome,
		LEN(Nome) AS Comprimento
FROM TabelaClientes

----------------------------------------------------------------------------------------------------------------------------------

/*
5. A liderança da DataFinance solicitou um relatório detalhado dos responsáveis pelos departamentos da empresa. 
Atualmente, os dados estão separados, mas o setor de Recursos Humanos precisa exibir o nome completo do colaborador, 
seguido de seu cargo no departamento, em uma única coluna.

Que consulta SQL poderia ser criada para apresentar essas informações de maneira clara e organizada?
*/
SELECT CONCAT(NomeColaborador, ' - ', Cargo) AS [Nome & Cargo]
FROM TabelaColaboradores

----------------------------------------------------------------------------------------------------------------------------------

/*
6. A tarefa de revisar os relatórios internos da DataFinance faz parte de uma atualização nos processos de gestão. 
Durante uma reunião, foi decidido que os nomes dos departamentos precisam ser simplificados para melhorar a clareza nos relatórios. 
Um exemplo dessa mudança é o setor de "Recursos Humanos", que passará a ser exibido como "RH".

Que consulta SQL poderia ser utilizada para ajustar os nomes exibidos, substituindo "Recursos Humanos" por "RH"?
*/
SELECT REPLACE(NomeDepartamento, 'Recursos Humanos', 'RH') AS [Nome Atualizado]
FROM TabelaDepartamento

/*
7. Neste desafio, você irá aprimorar a apresentação dos dados de empréstimos para facilitar a leitura e a interpretação rápida 
das informações essenciais. Usando funções de manipulação de strings e formatação numérica no SQL, 
você criará uma descrição formatada para cada empréstimo listado na tabela Empréstimo.

O objetivo é combinar as informações de tipo, status e valor do empréstimo em uma única string formatada que seja clara, 
informativa e estéticamente agradável.
*/
SELECT CONCAT(TRIM(Tipo), ' - ', Status, ' - ', '$', Valor) AS [Descricao do Emprestimo]
FROM TabelaEmprestimo

/*
8. A organização dos registros de pagamentos está sendo aprimorada pela equipe financeira para tornar o sistema mais eficiente. 
Para melhorar a visualização e facilitar consultas, foi solicitado que cada pagamento receba um identificador único baseado no status 
e no ID do pagamento. Por exemplo, pagamentos com status "Pago" podem gerar identificadores como "PagP01".

Qual consulta SQL poderia ser usada para gerar um identificador único para cada pagamento, exibindo o status e o ID do pagamento concatenados?
*/
SELECT	id_pagamento,
		CONCAT(SUBSTRING(Status, 1, 3), id_pagamento) AS [Identificador do Pagamento]
FROM TabelaPagamentos

/*
9. O setor de análise de crédito precisa padronizar os relatórios utilizados em apresentações para investidores. 
Um problema identificado foi a inconsistência nas fontes de consulta do score de crédito, onde algumas aparecem com nomes longos, 
como "Boa Vista", enquanto outras são abreviadas, como "SPC".

Para garantir que todos os dados estejam uniformes, é necessário padronizar as fontes. 
O nome "Serasa" deve ser convertido para "SER", "SPC" permanece como está, e "Boa Vista" deve ser abreviado para "BOA".

Como você criaria uma consulta para gerar as abreviações padronizadas das fontes de consulta do score de crédito?
*/
SELECT	id_score,
		Fonte,
		REPLACE(REPLACE(Fonte, 'Serasa', 'SER'), 'Boa Vista', 'BOA') AS [Fonte Abreviada]
FROM TabelaScoreCredito

/*
10. Durante uma auditoria, o setor financeiro identificou inconsistências nos registros de tipos de empréstimos. 
Alguns registros possuem espaços extras no início ou no final dos valores, o que está causando problemas em relatórios e sistemas integrados.

Sua missão é corrigir essas inconsistências, removendo os espaços extras nos valores da coluna Tipo.

Qual consulta você utilizaria para exibir os tipos de empréstimos já padronizados?
*/
SELECT	id_emprestimo,
		TRIM(Tipo) AS Tipo
FROM TabelaEmprestimo