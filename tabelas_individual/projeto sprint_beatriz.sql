-- criar banco de dados
create database SmartBerry;
use SmartBerry;

-- criar a tabela usuario
CREATE TABLE Usuario (
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cpf CHAR(11),
    cnpj CHAR(14) NOT NULL UNIQUE,
    telCelular FLOAT NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    senha CHAR(8) NOT NULL,
    DtNasc DATE NOT NULL,
    cep VARCHAR(9) NOT NULL,
    númeroComplemento FLOAT NOT NULL,
    tipoUsuario VARCHAR(45),
    CONSTRAINT chkUsuario CHECK (tipoUsuario IN ('Cliente' , 'Administrador'))
);

 
 -- criar a tabela sensor
 CREATE TABLE RegistroSensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    nomeSensor VARCHAR(25) NOT NULL default 'Umidade do solo' not null,
    statusSensor VARCHAR(15) not null , 
    LocalizacaoSensor VARCHAR(30) not null ,
    dadoSensor VARCHAR(30) not null,
    dataInstalacao DATETIME not null,
    dataHoraDadoSensor DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ckStatussensor CHECK (statusSensor IN ('Ativo' , 'Inativo', 'Em manutenção'))
);



 
 -- criar tabela producao
 create table Producao (
 idFruta int primary key auto_increment ,
 nome varchar (20) default 'Morango' not null, 
 HactaresPlantados int not null, 
 HectaresColhidos int not null, 
 dataPlantacao date not null, 
 dataColheita date not null, 
 statusProducao varchar (15) not null, 
 constraint ckSatusProducao
 check (statusProducao in('Em andamento' , 'Concluido'))
 );
 
 
 -- inserindo dados na tabela Usuario
 INSERT INTO Usuario  VALUES
(DEFAULT,'João Silva', '12345678900', '12345678901234', 5598987654321, 'joao.silva@email.com', 'senha123', '1990-05-12', '01001-000', 123, 'Cliente'),
(DEFAULT,'Maria Oliveira', '98765432100', '56789012345678', 5599998765432, 'maria.oliveira@email.com', 'senha456', '1985-10-25', '02002-111', 456, 'Administrador'),
(DEFAULT,'Ana Santos', '11122233344', '34567890123456', 5598887654321, 'ana.santos@email.com', 'senha789', '2000-07-15', '03003-222', 789, 'Cliente'),
(DEFAULT, 'Carlos Lima', '55566677788', '78901234567890', 5597776543210, 'carlos.lima@email.com', 'senha012', '1995-02-28', '04004-333', 321, 'Administrador');

-- inserindo dados na tabela RegistroSensor
INSERT INTO RegistroSensor VALUES
(DEFAULT, 'Umidade de Solo', 'Ativo', 'Setor 1', '25', '2025-03-10', '2024-06-15 14:30:00'),
(DEFAULT, 'Umidade de Solo', 'Inativo', 'Setor 2', '30', '2025-03-11', '2024-07-01 10:00:00'),
(DEFAULT, 'Umidade de Solo', 'Em manutenção', 'Setor 3', '25', '2025-03-09', '2024-08-20 16:45:00'),
(DEFAULT, 'Umidade de Solo', 'Ativo', 'Setor 4', '35', '2025-03-12', '2024-09-05 08:20:00');

-- inserindo dados na tabela producao
INSERT INTO Producao VALUES
(DEFAULT, 'Morango', 10, 8, '2024-03-01', '2024-09-15', 'Concluido'),
(DEFAULT, 'Morango', 5, 4, '2023-02-10', '2023-08-20', 'Concluido'),
(DEFAULT, 'Morango', 7, 10, '2025-01-01', '2025-07-04', 'Em andamento'),
(DEFAULT, 'Morango', 12, 9, '2024-11-01', '2025-09-12', 'Em andamento');


select * from Usuario;


select * from RegistroSensor;

select * from Producao;



