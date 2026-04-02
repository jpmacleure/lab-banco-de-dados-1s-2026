/**/
/* Mostra todos os databases*/
show databases;

/* Seleciona um DB específico */
USE biblioteca_pessoal_1s2026;

/* Visualiza as tabelas de um DB*/
SHOW tables;

/* INSERE DADOS NO BD */
INSERT INTO usuario(nome, email, senha)
VALUES
	("João", "joao@email.com", "123"),
    ("Pedro", "pedro@email.com", "123");

INSERT INTO autor(nome)
VALUES ("Santo Agostinho"),
		("Aristóteles");

INSERT INTO editora(nome)
VALUES ("L&M"),
	("Companhia das Letras");

INSERT INTO categoria(nome) 
VALUES ("Filosofiaaa"),
	("Religião");

/* Visualiza dados cadastrados*/
SELECT * FROM usuario;
SELECT * FROM autor;
SELECT * FROM editora;
SELECT * FROM categoria;

/* Cadastra 2 livros para cada usuário*/
INSERT INTO livro (id_usuario, id_autor, id_editora,
	id_categoria, titulo, sinopse, ano_publicacao)
VALUES 
	(2, 3, 2, 2, "Ética a Nicômaco", "", 2011),
    (2, 3, 3, 2, "Política", "", 2007),
    (3, 2, 2, 3, "Confissões", "", 2015),
    (3, 2, 2, 3, "Sobre a vida feliz", "", 2001);
    
SELECT * FROM livro;

SELECT * FROM categoria;

/* REMOVE UM REGISTRO ESPECÍFICO */
DELETE FROM categoria 
WHERE id_categoria = 1;

SELECT * FROM categoria;

/* ATUALIZA UM REGISTRO ESPECÍFICO */
UPDATE categoria
SET nome = "Filosofia"
WHERE id_categoria=2;

select * from livro;
UPDATE livro
SET sinopse = "Reflexões sobre a justa medida para a felicidade."
WHERE id_livro=8;

/* CONSULTA DADOS EM MÚLTIPLAS TABELAS */
SELECT 
	t1.id_autor,
    t2.nome as autor,
	t1.titulo,
    t1.sinopse
FROM livro t1
LEFT JOIN autor t2 ON (t1.id_autor = t2.id_autor)
;
	
