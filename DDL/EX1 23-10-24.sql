CREATE SCHEMA evento;
use evento;

CREATE TABLE IF NOT EXISTS participantes(
	NUM_INSCRICAO int PRIMARY KEY,
    CPF varchar(14),
    NOME varchar(100),
    DATA_NASC date,
    EMPRESA varchar(100)    
);

CREATE TABLE IF NOT EXISTS locais(
	ID_LOCAL int PRIMARY KEY,
    NOME varchar(100),
    LOG_LOCAL varchar(100),
    NUMLOG_LOCAL int,
    BAIRRO_LOCAL varchar(100),
    CIDADE varchar(100),
    UF char(2),
    CEP varchar(20),
    CAPACIDADE int
);

CREATE TABLE IF NOT EXISTS eventos(
	ID_EVENTO int PRIMARY KEY,
    NOME_EVENTO varchar(100),
    DATA_EVENTO date,
    ENTIDADE_EVENTO varchar(100),
    LOCAL_EVENTO int,
    foreign key (LOCAL_EVENTO) references locais(ID_LOCAL)
);

CREATE TABLE IF NOT EXISTS atividades(
	ID_ATIVIDADE int PRIMARY KEY,
    NOME_ATV varchar(100),
    DATA_ATV date,
    HORA_ATV time,
    EVENTO_ATV int,
    foreign key (EVENTO_ATV) references eventos(ID_EVENTO) 
);

/*Entidade associativas*/

CREATE TABLE IF NOT EXISTS participante_evento(
	INSCRICAO int,
    EVENTO int,
    foreign key (INSCRICAO) references participantes(NUM_INSCRICAO),
    foreign key (EVENTO) references eventos(ID_EVENTO)
);

CREATE TABLE IF NOT EXISTS participante_atividade(
	INSCRICAO int,
    ATIVIDADE int,
    foreign key (INSCRICAO) references participantes(NUM_INSCRICAO),
    foreign key (ATIVIDADE) references atividades(ID_ATIVIDADE)
);

/*alterações*/

ALTER TABLE participantes ADD FIDELIDADE int;

DROP SCHEMA evento;






