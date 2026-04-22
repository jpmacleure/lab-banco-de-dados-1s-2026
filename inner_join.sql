/* CARREGA TODOS OS LIVROS */
select * from livro;

/*
Carrega todos os livros (titulo)
e busca o nome do autor
*/
SELECT
	t2.nome as nome_autor,
	t1.titulo
FROM
	livro t1
JOIN
	autor t2 ON (t1.id_autor = t2.id_autor);
    
/*
Carrega todos os livros (titulo)
e busca o nome do autor
e busca o nome da categoria
*/
SELECT 
    t2.nome AS nome_autor, t1.titulo, t3.nome AS nome_categoria
FROM
    livro t1
        JOIN
    autor t2 ON (t1.id_autor = t2.id_autor)
        JOIN
    categoria t3 ON (t1.id_categoria = t3.id_categoria);
    
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
    editora t5 ON (t1.id_editora = t5.id_editora)
