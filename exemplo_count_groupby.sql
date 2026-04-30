/* Busca título e 
todos os campos de nome das relações*/  
SELECT 
    t4.nome as nome_usuario,
    t2.nome AS nome_autor, 
    t1.titulo, 
    t3.nome AS nome_categoria,
    t5.nome as nome_editora
FROM
    livro t1
JOIN
    autor t2 ON (t1.id_autor = t2.id_autor)
JOIN
    categoria t3 ON (t1.id_categoria = t3.id_categoria)
JOIN
    usuario t4 ON (t1.id_usuario = t4.id_usuario)
JOIN
    editora t5 ON (t1.id_editora = t5.id_editora);
    
    
/* Conta quantidade de livros na tabela */
SELECT
	COUNT(*)
FROM
	LIVRO;

/* Conta quantidade de livros na tabela 
	Para um usuário específico
*/
SELECT
	COUNT(*)
FROM
	LIVRO
WHERE
	ID_USUARIO=1;
    
/* DELETA O LIVRO DE ID 1*/    
DELETE FROM LIVRO WHERE ID_LIVRO = 1;    

/* Conta quantidade de livros na tabela 
	para todos os usuários
*/
SELECT
	ID_USUARIO,
	COUNT(*)
FROM
	LIVRO
GROUP BY
	ID_USUARIO;

/* Conta quantidade de livros na tabela 
	para todos os usuários POR NOME
*/
SELECT
	t1.ID_USUARIO,
    t2.NOME,
	COUNT(t1.ID_LIVRO) AS QTD_LIVRO 
FROM
	LIVRO t1
JOIN
	USUARIO t2 ON (t1.ID_USUARIO = t2.ID_USUARIO)
GROUP BY
	t1.ID_USUARIO,
    t2.NOME;
    
/* Conta quantidade de livros na tabela 
	para todos as categorias POR NOME
*/
SELECT
	t1.ID_CATEGORIA,
    t2.NOME,
	COUNT(t1.ID_LIVRO) AS QTD_LIVRO 
FROM
	LIVRO t1
JOIN
	CATEGORIA t2 ON (t1.ID_CATEGORIA = t2.ID_CATEGORIA)
GROUP BY
	t1.ID_CATEGORIA,
    t2.NOME;
    
/* Conta quantidade de livros na tabela 
	para todos os usuários POR NOME
*/
SELECT
	t1.ID_USUARIO,
    t1.ID_CATEGORIA,
    t2.NOME AS USUARIO,
    t3.NOME AS CATEGORIA,
	COUNT(t1.ID_LIVRO) AS QTD_LIVRO 
FROM
	LIVRO t1
JOIN
	USUARIO t2 ON (t1.ID_USUARIO = t2.ID_USUARIO)
JOIN
	CATEGORIA t3 ON (t1.ID_CATEGORIA = t3.ID_CATEGORIA)
GROUP BY
	t1.ID_USUARIO,
    t1.ID_CATEGORIA,
    t2.NOME,
    t3.NOME
ORDER BY
t3.NOME, QTD_LIVRO DESC;


/* Conta quantidade E PERCENTUAL de livros na tabela 
	para todos as categorias POR NOME
*/
SELECT
	t1.ID_CATEGORIA,
    t2.NOME,
	COUNT(t1.ID_LIVRO) AS QTD_LIVRO,
    (COUNT(t1.ID_LIVRO)/(SELECT COUNT(*) FROM LIVRO))*100 AS PCT
FROM
	LIVRO t1
JOIN
	CATEGORIA t2 ON (t1.ID_CATEGORIA = t2.ID_CATEGORIA)
GROUP BY
	t1.ID_CATEGORIA,
    t2.NOME
ORDER BY
	PCT DESC;
