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


-- INSERINDO CLIENTES
INSERT INTO tbCliente (nomeCliente, dataNascimentoCliente, cpfCliente, cnpjCliente, telefoneCliente, emailCliente, cepCliente, nomePropriedade, numero, complemento, senhaCliente) VALUES 
('Carlos Pereira', '1990-04-10', '12309845601', NULL, '11912345670', 'carlos.pereira@icloud.com', '5432109', 'Hortas do Vale', '88', 'Próximo à ponte antiga', 'senha4567'),
('Mariana Alves', '1982-06-14', '78945612309', '10123456000123', '11965432109', 'mariana.alves@gmail.com', '6543210', 'Morangos & Sabor', '35', 'Próximo ao Centro Comercial', 'mariana2020'),
('Felipe Costa', '1998-11-02', '56234198765', NULL, '11976543210', 'felipe.costa@outlook.com', '2345987', 'Sítio dos Morangos', '40', 'Ao lado da represa', '1234felipe'),
('Cláudia Souza', '1988-08-23', '98712345678', NULL, '1122339988', 'claudia.souza@hotmail.com', '9087766', 'Colônia Santa Clara', '72', 'Fazendo divisa com o rio', 'claudia2022'),
('Ricardo Lima', '1975-02-14', '65498712300', '20987654321000', '11898765432', 'ricardo.lima@terra.com', '5678901', 'Fazenda Estrela do Sul', '150', 'Próximo ao campo de futebol', 'senhaRicardo123');


CREATE TABLE tbRegistroSensorUmidadesolocapacitivo (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusSensor VARCHAR(15) DEFAULT('Inativo'),
    localSensor VARCHAR(10) NOT NULL,
	dadoSensor FLOAT,
    dataHoraDadoSensor DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('Ativo' , 'Inativo', 'Em manutenção'))
);

-- INSERINDO SENSORES
INSERT INTO tbRegistroSensorUmidadeSolocapacitivo (statusSensor, localSensor, dadoSensor, dataHoraDadoSensor) VALUES
('Ativo', 'canteiroA', '28.4', '2025-03-17 08:30:00'),
('Inativo', 'canteiroB', '53.2', '2025-03-17 08:40:00'),
('Em manutenção', 'canteiroC', '67.9', '2025-03-17 08:45:00'),
('Ativo', 'canteiroD', '72.3', '2025-03-17 08:50:00'),
('Ativo', 'canteiroE', '77.1', '2025-03-17 08:55:00');


CREATE TABLE tbSafra (
    idSafra INT PRIMARY KEY AUTO_INCREMENT,
    qtdMudasPlantadas INT NOT NULL, 
    metrosPlantacao INT NOT NULL,
    qtdColhida FLOAT,
    data_semeadura DATE,
    dataColheita DATE,
    statusPlantacao VARCHAR(15),
    CONSTRAINT chkStatusPlantacao CHECK (statusPlantacao IN ('Em andamento' , 'Concluído'))
);

-- INSERINDO DADOS DA Plantação
INSERT INTO tbSafra (qtdMudasPlantadas, metrosPlantacao, qtdColhida, data_semeadura, dataColheita, statusPlantacao) VALUES 
(800, 3500, 12.3, '2022-01-15', '2022-09-10', 'Concluído'),
(650, 2800, 9.4, '2023-03-20', '2023-11-05', 'Concluído'),
(550, 1200, 7.1, '2024-05-10', '2025-03-15', 'Em andamento'),
(700, 2200, NULL, '2024-06-10', NULL, 'Em andamento');


-- Selecionando todos os dados da tabela de clientes
SELECT * FROM tbCliente;

-- Selecionando todos os dados da tabela de sensores
SELECT idSensor, statusSensor, localSensor, CONCAT(dadoSensor, '%') AS 'Umidade do Solo', dataHoraDadoSensor 
FROM tbRegistroSensorUmidadesolocapacitivo;

-- Selecionando todos os dados da tabela de Safras
SELECT * FROM tbSafra;

-- Mostrando os últimos dados registrados pelos sensores, ordenados pela data
SELECT idSensor, localSensor, CONCAT(dadoSensor, '%') AS 'Umidade do Solo', dataHoraDadoSensor
FROM tbRegistroSensorUmidadesolocapacitivo
ORDER BY dataHoraDadoSensor DESC;

-- Locais com excesso de umidade (sensor > 75%)
SELECT idSensor, CONCAT(dadoSensor, '%') AS 'Nível de Umidade do solo (ALTA)', localSensor AS 'Locais com Excesso de Umidade'
FROM tbRegistroSensorUmidadesolocapacitivo
WHERE dadoSensor > 75;

-- Locais com escassez de umidade (sensor < 65%)
SELECT idSensor, CONCAT(dadoSensor, '%') AS 'Nível de Umidade do solo (BAIXA)', localSensor AS 'Locais com Escassez de Umidade'
FROM tbRegistroSensorUmidadesolocapacitivo
WHERE dadoSensor < 65;

-- Mostrando quantidade de mudas plantadas em determinado período
SELECT qtdMudasPlantadas, CONCAT(metrosPlantacao, ' m²') AS 'Área Plantada', data_semeadura  
FROM tbSafra 
WHERE data_semeadura >= '2021-09-01' AND data_semeadura <= '2024-04-05';

-- Mostrando morangos colhidos em determinado período
SELECT CONCAT(qtdColhida, ' kg') AS 'Quantidade de Morangos Colhidos', dataColheita
FROM tbSafra 
WHERE dataColheita >= '2022-03-01' AND dataColheita <= '2023-02-25';

-- Mostrando as plantações em andamento
SELECT idSafra, qtdMudasPlantadas, CONCAT(metrosPlantacao, ' m²') AS 'Área Plantada', data_semeadura, statusPlantacao
FROM tbSafra 
WHERE statusPlantacao LIKE '%andamento%';

-- Atualizando a localização do sensor
UPDATE tbRegistroSensorUmidadesolocapacitivo 
SET localSensor = 'canteiro6' 
WHERE idSensor = 1;

-- Verificando a atualização na localização do sensor
SELECT idSensor, localSensor 
FROM tbRegistroSensorUmidadesolocapacitivo 
WHERE idSensor = 1;

-- Alterando a quantidade de caracteres da coluna 'localSensor'
ALTER TABLE tbRegistroSensorUmidadesolocapacitivo 
MODIFY COLUMN localSensor VARCHAR(20);

-- Descrevendo a tabela de sensores para verificar a estrutura
DESCRIBE tbRegistroSensorUmidadesolocapacitivo;

