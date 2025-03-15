CREATE DATABASE smartBarry;

USE smartBarry;

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT
    , nome VARCHAR(50) NOT NULL
    , dataNasc DATE
    , cpf CHAR(11) UNIQUE
    , cnpj CHAR(14) UNIQUE
    , telefoneCelular CHAR(12) NOT NULL
    , email VARCHAR(40) NOT NULL UNIQUE
    , senha VARCHAR(255) NOT NULL
    , cep CHAR(9) NOT NULL
    , nomeFantasia VARCHAR(45)
    , numero VARCHAR(5) NOT NULL
    , complemento VARCHAR(45)

);

CREATE TABLE registroSensorUmidadeSolo (
    idSensor INT PRIMARY KEY AUTO_INCREMENT
    , nomeSensor VARCHAR(45) DEFAULT 'Umidade do solo capacitivo'
    , localSensor VARCHAR(45) NOT NULL
    , dataInstalacao DATETIME NOT NULL 
    , dadosSensor FLOAT
    , dataDadoSensor DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
    , statusSensor VARCHAR(45) 
    , CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('Ativo', 'Inativo', 'Em manutenção'))
);

CREATE TABLE plantacao (
    idPlantacao INT PRIMARY KEY AUTO_INCREMENT
    , nomeFruta VARCHAR(50) DEFAULT 'Morango'
    , qtdMudasPlantadas INT NOT NULL
    , metrosQuadradosPlantados FLOAT NOT NULL
    , dataPlantio DATE DEFAULT CURRENT_TIMESTAMP NOT NULL
    , dataColheita DATE NOT NULL
    , statusPlantacao VARCHAR(50) DEFAULT 'Em andamento' 
    ,CONSTRAINT chkStatusPlantcao CHECK (statusProducao IN ('Em andamento', 'Concluído'))
);


-- INSERINDO CLIENTES

-- Inserindo dados na tabela usuario

INSERT INTO usuario (nome, dataNasc, cpf, telefoneCelular, email, senha, cep, nomeFantasia, numero, complemento) VALUES 
	('João Silva', '1990-05-15', '12345678901', '11987654321', 'joao@email.com', 'senha123', '01001-000', 'Fazenda Silva', '123', 'Casa 2')
		, ('Maria Oliveira', '1985-09-22', '98765432100', '11912345678', 'maria@email.com', 'senha456', '02002-000', 'Sítio Oliveira', '456', 'Bloco B')
		, ('Carlos Mendes', '1992-07-10', '11122233344', '11988887777', 'carlos@email.com', 'senha789', '03003-000', 'Fazenda Mendes', '789', 'Sítio', 'Cliente')
		, ('Ana Souza', '1988-11-25', '55566677788', '11977776666', 'ana@email.com', 'senha321', '04004-000', 'Sítio Souza', '159', 'Chácara', 'Administrador');


-- Inserindo dados na tabela registroSensorUmidadeSolo

INSERT INTO registroSensorUmidadeSolo (localSensor, dataInstalacao, dadosSensor, statusSensor) VALUES 
 ('Canteiro 1', '2025-03-10 08:00:00', 70.0, 'Ativo')
 , ('Canteiro 2', '2025-03-11 10:30:00', 65.0, 'Em manutenção')
 , ('Canterio 3', '2025-03-12 09:15:00', 68.0, 'Ativo')
 , ('Canteiro 4', '2025-03-13 14:00:00', 60.8, 'Ativo');

-- Inserindo dados na tabela plantacao

INSERT INTO plantacao (nomeFruta, qtdMudasPlantadas, metrosQuadradosPlantados, dataPlantio, dataColheita, statusPlantacao) VALUES 
    ('Morango', 500, 200.5, '2025-03-01', '2025-06-15', 'Em andamento')
		, ('Morango', 300, 150.0, '2025-02-20', '2025-05-30', 'Concluído')
        , ('Morango', 200, 50.0, '2025-02-15',NULL, 'Em Andamento')
        , ('Morango', 150, 80.0, '2025-02-15', NULL, 'Em andamento', 16.5);

-- SELECT 

SELECT * FROM usuario;

SELECT * FROM registroSensorUmidadeSolo;

SELECT * FROM plantacao;

-- ALTER

ALTER TABLE usuario ADD COLUMN dataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE registroSensorUmidadeSolo MODIFY COLUMN statuspLANTACAO VARCHAR(40);

-- UPDATE

UPDATE registroSensorUmidadeSolo SET statusSensor = 'Inativo' WHERE idSensor = 2;

UPDATE plantacao SET statusPlantacao = 'Concluido' WHERE idPlantacao = 1;


