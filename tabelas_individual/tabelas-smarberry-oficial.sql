CREATE DATABASE bdSmartBerry; 
USE bdSmartBerry;

CREATE TABLE tbCliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(45) NOT NULL,
    dataNascimentoCliente DATE NOT NULL,
    cpfCliente CHAR(11) UNIQUE NOT NULL,
    cnpjCliente CHAR(14) UNIQUE,
    telefoneCliente CHAR(11) NOT NULL,
    emailCliente VARCHAR(35) NOT NULL,
    cepCliente CHAR(7) NOT NULL,
    nomePropriedade VARCHAR(50),
    numero VARCHAR(5),
    complemento VARCHAR(30),
    senhaCliente VARCHAR(15) NOT NULL
);

CREATE TABLE tbRegistroSensorUmidadeSolo (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusSensor VARCHAR(15) DEFAULT('Inativo'),
    localizacaoSensor VARCHAR(10) NOT NULL,
	dadoSensor FLOAT,
    dataHoraDadoSensor DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('Ativo' , 'Inativo', 'Em manutenção'))
);

CREATE TABLE tbPlantacao (
    idPlantacao INT PRIMARY KEY AUTO_INCREMENT,
    qtdMudasPlantada INT NOT NULL, 
    metrosQuadradosAreaPlantada INT NOT NULL,
    qtdColhida FLOAT, -- EM (Kg)
    dataPlantio DATE,
    dataColheita DATE,
    statusPlantacao VARCHAR(15),
    CONSTRAINT chkStatusPlantacao CHECK (statusPlantacao IN ('Em andamento' , 'Concluído'))
);

-- INSERINDO CLIENTES
INSERT INTO tbCliente (nomeCliente, dataNascimentoCliente, cpfCliente, cnpjCliente, telefoneCliente, emailCliente, cepCliente, nomePropriedade, numero, complemento, senhaCliente) VALUES 
('Ana Souza', '1985-07-25', '12345678902', '21824381000101', '11987654322', 'ana.souza@gmail.com', '1234567', 'Morangos Souza', '110', 'Próximo à Fazenda São João', 'senha1234'),
('Bruno Silva', '1992-03-10', '98765432100', '04063429000189', '1122334455', 'bruno.silva@hotmail.com', '8765432', 'Silva Produtora', '65', 'Ao lado da Trilha da Mata', '7890senha'),
('Rodrigo Oliveira', '1978-09-15', '45678912345', NULL, '11912345678', 'rodrigo.oliveira@gmail.com', '2345678', 'Plantação Morango Feliz', '77', 'Abaixo da Serra', 'senha9876'),
('Luna Costa', '1995-12-20', '74125896300', NULL, '11998765432', 'luna.costa@outlook.com', '3456789', 'Morangos da Costa', '15', 'Próximo ao Rio Preto', 'senha2022'),
('Fernanda Torres', '2000-01-05', '32165498701', NULL, '11876543210', 'fernanda.torres@gmail.com', '4567890', 'Plantação Família Torres', '120', 'No topo do Morro Baixo', '0101abc');

-- INSERINDO SENSORES
INSERT INTO tbRegistroSensorUmidadeSolo (statusSensor, localizacaoSensor, dadoSensor, dataHoraDadoSensor) VALUES
('Ativo', 'canteiro1', '30.9', '2025-03-10 14:00:00'),
('Inativo', 'canteiro2', '55.5', '2025-03-10 14:10:00'),
('Em manutenção', 'canteiro3', '65.1', '2025-03-10 14:15:00'),
('Ativo', 'canteiro4', '75.0', '2025-03-10 14:20:00'),
('Ativo', 'canteiro5', '80.5', '2025-03-10 14:25:00');

-- INSERINDO DADOS DA Plantação
INSERT INTO tbPlantacao (qtdMudasPlantada, metrosQuadradosAreaPlantada, qtdColhida, dataPlantio, dataColheita, statusPlantacao) VALUES 
(750, 3000, 10.1, '2021-09-01', '2022-03-01', 'Concluído'),
(600, 2500, 8.9, '2022-08-10', '2023-02-25', 'Concluído'),
(500, 1000, 6.7, '2023-06-15', '2024-04-10', 'Concluído'),
(670, 2000, NULL, '2024-04-05', NULL, 'Em andamento'),
(770, 2700, NULL, '2025-07-20', NULL, 'Em andamento');

-- Selects da tabela inteira
select * from tbCliente;
select idSensor, statusSensor, localizacaoSensor, CONCAT(dadoSensor, '%') AS 'Umidade do Solo', dataHoraDadoSensor from tbRegistroSensorUmidadeSolo;
select * from tbPlantacao;

-- Mostrando os últimos dados registrados pelo sensor
select idSensor, localizacaoSensor, CONCAT(dadoSensor, '%') AS 'Umidade do Solo', dataHoraDadoSensor
	from tbRegistroSensorUmidadeSolo order by dataHoraDadoSensor desc;
    
-- Locais com excesso de umidade
select idSensor, CONCAT(dadoSensor, '%') AS 'Nível de Umidade do solo (ALTA)', localizacaoSensor AS 'Locais com Excesso de Umidade'
	from tbRegistroSensorUmidadeSolo where dadoSensor > 75;

-- Locais com excasses de umidade
select idSensor, CONCAT(dadoSensor, '%') AS 'Nível de Umidade do solo (BAIXA)', localizacaoSensor AS 'Locais com Excassez de Umidade'
	from tbRegistroSensorUmidadeSolo where dadoSensor < 65;
    
-- Mostrando quantidade de mudas plantadas em determinado período
select qtdMudasPlantada, CONCAT(metrosQuadradosAreaPlantada, ' m²') AS 'Area Plantada', dataPlantio  
	from tbPlantacao where dataPlantio >= '2021-09-01' and dataPlantio <= '2024-04-05';

-- Mostrando morangos colhidos em determinado período 
select CONCAT(qtdColhida, ' kg') AS 'Quantidade de Morangos Colhidos', dataColheita
	from tbPlantacao where dataColheita >= '2022-03-01' and dataColheita <= '2023-02-25';
       
-- Mostrando as plantações em andamento
select idPlantacao, qtdMudasPlantada, CONCAT(metrosQuadradosAreaPlantada, ' m²') AS 'Area Plantada', dataPlantio, statusPlantacao
	from tbPlantacao where statusPlantacao LIKE '%andamento%';

-- Atualizando a localização do sensor
update tbRegistroSensorUmidadeSolo set localizacaoSensor = 'canteiro6' where idSensor = 1;
select idSensor, localizacaoSensor from tbRegistroSensorUmidadeSolo where idSensor = 1;

-- Alterando quantidade de quantidade de caracteres do nome do sensor
alter table tbRegistroSensorUmidadeSolo modify column localizacaoSensor varchar (20); 
describe tbRegistroSensorUmidadeSolo;