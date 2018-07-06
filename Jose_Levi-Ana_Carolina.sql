CREATE SCHEMA IF NOT EXISTS projetoata;

USE projetoata;

DROP TABLE IF EXISTS projetoata.projeto_ata;
DROP TABLE IF EXISTS projetoata.ata_aluno;
DROP TABLE IF EXISTS projetoata.ata_enc;
DROP TABLE IF EXISTS projetoata.projeto;
DROP TABLE IF EXISTS projetoata.ata;
DROP TABLE IF EXISTS projetoata.professor;
DROP TABLE IF EXISTS projetoata.encaminhamento;
DROP TABLE IF EXISTS projetoata.aluno;

CREATE TABLE IF NOT EXISTS
	projetoata.professor 
    (
		id_prof INT NOT NULL auto_increment,
        nome VARCHAR(200) NOT NULL,
        formacao VARCHAR(200) NOT NULL,
        titulacao VARCHAR(200),
        PRIMARY KEY (id_prof)
    );
    
CREATE TABLE IF NOT EXISTS 
	projetoata.projeto
    (
		id_proj INT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(200) NOT NULL,
        id_prof INT NOT NULL,
        PRIMARY KEY(id_proj),
        FOREIGN KEY (id_prof)
			REFERENCES projetoata.professor (id_prof)
    );
    
CREATE TABLE IF NOT EXISTS
	projetoata.ata
    (
		id_ata INT NOT NULL AUTO_INCREMENT,
        assunto VARCHAR(200) NOT NULL,
		data_realizacao DATE,
        professor INT NOT NULL,
        PRIMARY KEY (id_ata),
        FOREIGN KEY (professor)
			REFERENCES projetoata.professor (id_prof)
    );

CREATE TABLE IF NOT EXISTS
	projetoata.aluno
    (
		id_aluno INT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(200) NOT NULL,
        cpf VARCHAR(50) NOT NULL,
        curso VARCHAR(200) NOT NULL,
        PRIMARY KEY (id_aluno)
    );
    
CREATE TABLE IF NOT EXISTS
	projetoata.encaminhamento
    (
		id_enc INT NOT NULL AUTO_INCREMENT,
        assunto VARCHAR(200) NOT NULL,
        id_aluno INT NOT NULL,
        tarefa VARCHAR(200) NOT NULL,
        PRIMARY KEY (id_enc),
        FOREIGN KEY (id_aluno)
			REFERENCES projetoata.aluno (id_aluno)
    );
    
CREATE TABLE IF NOT EXISTS
	projetoata.projeto_ata
    (
		ata INT NOT NULL,
        proj INT NOT NULL,
        PRIMARY KEY(ata, proj),
        FOREIGN KEY (ata)
			REFERENCES projetoata.ata (id_ata),
		FOREIGN KEY (proj)
			REFERENCES projetoata.projeto (id_proj)
        
    );
    
CREATE TABLE IF NOT EXISTS
	projetoata.ata_aluno
    (
		id_ata INT NOT NULL,
        id_aluno INT NOT NULL,
        PRIMARY KEY(id_ata, id_aluno),
        FOREIGN KEY (id_ata)
			REFERENCES projetoata.ata (id_ata),
		FOREIGN KEY (id_aluno)
			REFERENCES projetoata.aluno (id_aluno)
    );
    
CREATE TABLE IF NOT EXISTS
	projetoata.ata_enc
    (
		id_enc INT NOT NULL,
        id_ata INT NOT NULL,
        PRIMARY KEY (id_enc, id_ata),
        FOREIGN KEY (id_enc)
			REFERENCES projetoata.encaminhamento (id_enc),
		FOREIGN KEY (id_ata)
			REFERENCES projetoata.ata (id_ata)
    );
    