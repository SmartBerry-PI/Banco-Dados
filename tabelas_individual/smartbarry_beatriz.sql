-- criar banco de dados
create database SmartBerry;
use SmartBerry;

-- criar a tabela usuario
CREATE TABLE Cliente (
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf CHAR(11) UNIQUE,
    cnpj CHAR(14) NOT NULL UNIQUE,
    telCelular FLOAT NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    senha CHAR(8) NOT NULL,
    dtNasc DATE NOT NULL,
    cep VARCHAR(9) NOT NULL,
    número VARCHAR(5),
    complemento VARCHAR(30)
);

 
 -- criar a tabela sensor
 CREATE TABLE RegistroSensorUmidadeSolo (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    LocalizacaoSensor VARCHAR(10) not null ,
    dadoSensor float,
    dataHoraDadoSensor DATETIME DEFAULT CURRENT_TIMESTAMP,
	statusSensor VARCHAR(15) default ('Inativo') , 
    CONSTRAINT ckStatussensor CHECK (statusSensor IN ('Ativo' , 'Inativo', 'Em manutenção'))
);

 
 -- criar tabela producao
 CREATE TABLE Plantacao (
    idFruta INT PRIMARY KEY AUTO_INCREMENT,
    metrosQuadradosAreaPlantada INT NOT NULL,
    qtdMudasPlantadas INT NOT NULL,
    dataPlantacao DATE NOT NULL,
    dataColheita DATE NOT NULL,
    statusProducao VARCHAR(15) NOT NULL,
    CONSTRAINT ckSatusProducao CHECK (statusProducao IN ('Em andamento' , 'Concluido'))
);
 
 -- inserindo os dados da tabela Cliente
INSERT INTO Cliente VALUES
(DEFAULT, 'João Silva', '12345678900', '12345678901234', 5598987654321, 'joao.silva@email.com', 'senha123', '1990-05-12', '01001-000', '123', NULL),
(DEFAULT, 'Maria Oliveira', '98765432100', '56789012345678', 5599998765432, 'maria.oliveira@email.com', 'senha456', '1985-10-25', '02002-111', '456', NULL),
(DEFAULT, 'Ana Santos', '11122233344', '34567890123456', 5598887654321, 'ana.santos@email.com', 'senha789', '2000-07-15', '03003-222', '789', NULL),
(DEFAULT, 'Carlos Lima', '55566677788', '78901234567890', 5597776543210, 'carlos.lima@email.com', 'senha012', '1995-02-28', '04004-333', '321', NULL);



-- inserindo dados na tabela RegistroSensor
INSERT INTO RegistroSensorUmidadeSolo VALUES
(DEFAULT, 'Canteiro 1', 65, '2024-06-15 14:30:00', 'Ativo'),
(DEFAULT, 'Canteiro 2', 81, '2024-07-01 10:00:00', 'Inativo'),
(DEFAULT, 'Canteiro 3', 50, '2024-08-20 16:45:00', 'Em manutenção'),
(DEFAULT, 'Canteiro 4', 75, '2024-09-05 08:20:00', 'Ativo');

-- inserindo dados na tabela producao
INSERT INTO Plantacao VALUES
(DEFAULT, 10, 8, '2024-03-01', '2024-05-15', 'Concluido'),
(DEFAULT, 5, 7, '2023-02-10', '2023-04-20', 'Concluido'),
(DEFAULT, 7, 6, '2025-01-01', '2025-03-04', 'Em andamento'),
(DEFAULT, 12, 9, '2024-11-01', '2025-01-12', 'Em andamento');



-- apresnetar a tabela Cliente
select * from Cliente;

-- apresentar a tabela RegistroSensorUmidadeSolo
select * from RegistroSensorUmidadeSolo;

-- apresentar a tabela Producao
select * from Plantacao;

-- apresnetando os setores com excesso de umidade 
select idSensor, LocalizacaoSensor, concat (dadoSensor, '%') AS 'Umidade do Solo (ALta)' , dataHoraDadoSensor from RegistroSensorUmidadeSolo where dadoSensor >75;

-- apresentando os setores com falta de umidade 
select idSensor, LocalizacaoSensor, concat(dadoSensor, '%') AS "Umidade do Solo (Baixa)", dataHoraDadoSensor from RegistroSensorUmidadeSolo where dadoSensor <65;

-- apresentando os solos com a tempereatura ideal
select idSensor, LocalizacaoSensor, concat(dadoSensor, '%') "Umidade do solo (Ideal)", dataHoraDadoSensor from RegistroSensorUmidadeSolo where dadoSensor >= 65  and dadoSensor <=75;

-- apresentando morangos colhidos em determinado periodo 
select concat(qtdMudasPlantadas, 'KG') AS "Quantidade de morangos colhidos",  dataPlantacao , dataColheita,  statusProducao from Plantacao where dataColheita >= "2023-04-20" and dataColheita <= "2024-05-15";

-- apresentando os morangos que ainda estão em produção
select concat(qtdMudasPlantadas, 'KG') "Morangos em produção" ,  dataPlantacao , dataColheita, statusProducao from Plantacao where statusProducao like '%Em andamento%';

-- alterando o nome da coluna da tabela plamtacao
alter table Plantacao rename column metrosQuadradosAreaPlantada to Areaplantada;

-- atualizando o dado da colheita da tabela Plantacao
update Plantacao set  qtdMudasPlantadas= '10'
where idFruta = '4';
























