show tables;

/* */

/* INSERIR DADOS EM UMA TABELA*/
INSERT INTO livro (id_usuario, id_autor, id_editora,
	id_categoria, titulo, sinopse, ano_publicacao)
VALUES (1, 1, 1, 1, "Livro Teste", "", 2026);

/* CADASTRA USUARIO, AUTOR, EDITORA E CATEGORIA*/
INSERT INTO autor(nome) VALUES("Autor Teste");
INSERT INTO editora(nome) VALUES("Editora Teste");
INSERT INTO categoria(nome) VALUES("Categoria Teste");
INSERT INTO usuario(nome, email, senha)
 VALUES("Usuário Teste", "usuario@email.com", "123");

/* SELECIONAR DADOS DE UMA TABELA */
SELECT * FROM livro;