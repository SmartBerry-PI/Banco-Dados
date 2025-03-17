CREATE DATABASE PISmartBerry;

CREATE TABLE Cliente (
 idCliente INT PRIMARY KEY AUTO_INCREMENT,
 nomeCliente VARCHAR(45) NOT NULL,
 dtNascCliente DATE NOT NULL,
 cpfCliente CHAR(14) UNIQUE NOT NULL,
 cnpjCliente CHAR(18) UNIQUE,
 telefoneCliente CHAR(15) UNIQUE NOT NULL,
 emailCliente VARCHAR(35) NOT NULL,
 cepCliente CHAR(9) NOT NULL,
 propriedade VARCHAR (100),
 numero VARCHAR(10),
 complemento VARCHAR(100),
 senhaCliente VARCHAR(20) NOT NULL
 );
 
 
 
CREATE TABLE registroDoSensorUmidadeSolo (
 idSensor INT PRIMARY KEY AUTO_INCREMENT, 
 nome VARCHAR(45) DEFAULT 'Umidade de solo capacitivo',
 localSensor VARCHAR(20) NOT NULL, 
 dataInstalacao DATETIME NOT NULL, 
 dados FLOAT, 
 dataDadoSensor DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 
 statusSensor VARCHAR(30), 
 CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('Ativo', 'Inativo', 'Em manutenção'))
);



CREATE TABLE plantacao (
idPlantacao INT PRIMARY KEY AUTO_INCREMENT, 
nomeFruta VARCHAR(50) DEFAULT 'Morango', 
qtdMudasPlantadas INT NOT NULL, 
metrosQuadradosPlantados FLOAT NOT NULL, 
dataPlantio TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
dataColheita DATE NOT NULL, 
statusProducao VARCHAR(50) DEFAULT 'Em andamento',
CONSTRAINT chkStatusPlantcao CHECK (statusProducao IN ('Em andamento', 'Concluído'))
);



INSERT INTO Cliente 
(nomeCliente, dtNascCliente, cpfCliente, cnpjCliente, telefoneCliente, emailCliente, cepCliente, propriedade, numero, complemento, senhaCliente)
VALUES
('Lucas Almeida', '1985-03-12', '123.456.789-01', '12.345.678/0001-90', '(11)91234-5678', 'lucas.almeida@email.com', '01000-000', 'Sítio Boa Vista', '100', 'Casa Principal', 'senhaLucas85'),
('Mariana Souza', '1990-07-25', '234.567.890-12', NULL, '(21)92345-6789', 'mariana.souza@email.com', '20000-000', 'Chácara Santa Luzia', '150', 'Próximo ao lago', 'senhaMari90'),
('Carlos Pereira', '1978-11-05', '345.678.901-23', '98.765.432/0001-56', '(31)93456-7890', 'carlos.pereira@email.com', '30000-000', 'Fazenda Bela Vista', '500', '', 'senhaCarlos78'),
('Ana Lima', '1995-02-18', '456.789.012-34', NULL, '(41)94567-8901', 'ana.lima@email.com', '40000-000', 'Sítio Recanto Feliz', '250', 'Ao lado da escola rural', 'senhaAna95');



INSERT INTO registroDoSensorUmidadeSolo (localSensor, dataInstalacao, dados, statusSensor) VALUES
 ('Canteiro 1', '2025-03-10 08:00:00', 72.5, 'Ativo'),
 ('Canteiro 2', '2025-03-11 10:30:00', 63.4, 'Em manutenção'),
 ('Canteiro 3', '2025-03-12 09:15:00', 69.8, 'Ativo'),
 ('Canteiro 4', '2025-03-13 14:00:00', 61.2, 'Ativo');
 
 
 
 INSERT INTO plantacao (nomeFruta, qtdMudasPlantadas, metrosQuadradosPlantados, dataColheita, statusProducao) VALUES
('Morango', 1000, 250.0, '2025-06-10', 'Em andamento'),
('Morango', 500, 150.0, '2025-07-15', 'Concluído'),
('Morango', 1200, 300.0, '2025-08-20', 'Em andamento'),
('Morango', 800, 200.0, '2025-09-30', 'Concluído');



SELECT * FROM cliente;

SELECT * FROM registroDOsensorUmidadeSolo;

SELECT * FROM plantacao;
 
 
 












