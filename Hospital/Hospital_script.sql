CREATE DATABASE hospital_sql;
USE hospital_sql;

CREATE TABLE funcionarios
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45) not null,
    PRIMARY KEY (id)    
);
CREATE TABLE veiculos
(
	id int unsigned not null auto_increment,
	funcionario_id int unsigned default null,
    veiculo varchar(45) not null default '',
    placa varchar(10) not null default '',
    primary key (id),
    CONSTRAINT fk_veiculos_funcionarios foreign key(funcionario_id) REFERENCES funcionarios (id)
);
CREATE TABLE salarios
(
	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);

CREATE TABLE pacientes
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    endereco varchar(100) not null,
    telefone varchar(45) not null,
    email varchar(100),
    cpf varchar(13),
    primary key (id)

);

CREATE TABLE consulta
(
    id int unsigned not null auto_increment,
    paciente_id int unsigned not null,
    funcionario_id int unsigned not null,
    data_hora datetime not null,
    descricao varchar(255),
    PRIMARY KEY (id),
    CONSTRAINT fk_consulta_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes (id),
    CONSTRAINT fk_consulta_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
);

