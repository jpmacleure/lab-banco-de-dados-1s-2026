/* SELECIONA BD*/
USE biblioteca_pessoal_1s2026;

/* CRIA TABELA DE AUDITORIA */
CREATE TABLE audit_livro(
	acao VARCHAR(255),
    usuario_bd VARCHAR(255),
    id_livro INT,
    dados_antigos TEXT,
    dados_novos TEXT,
    data_acao TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);

/* 
	CRIAR GATILHO/TRIGGER PARA CONTROLE DE UPDATES
	NA TABELA LIVRO
*/
DELIMITER $$
CREATE TRIGGER audit_update_livro
AFTER UPDATE ON livro
FOR EACH ROW
BEGIN
	INSERT INTO audit_livro 
		(acao, usuario_bd, id_livro, dados_antigos, dados_novos)
	VALUES /*CONCAT: Titulo: 1984 Lido: 0*/
		("UPDATE", USER(), OLD.id_livro, 
			CONCAT("Título: ", OLD.titulo, " Lido: ", OLD.lido),
            CONCAT("Título: ", NEW.titulo, " Lido: ", NEW.lido)
		);
END$$
DELIMITER ;

/*BUSCA LIVROS*/
SELECT * FROM LIVRO;
/*ALTERA LIVRO ID 2 PARA LIDO = 0*/
UPDATE livro
SET lido = 0
WHERE id_livro = 2;

/* VISUALIZA REGISTROS DA TABELA audit_livro */
SELECT * FROM audit_livro;

/* CRIA USUÁRIO DE BD */
CREATE USER "USUARIO_AUXILIAR"@"%" IDENTIFIED BY "catolica";
