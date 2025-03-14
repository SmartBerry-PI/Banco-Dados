CREATE DATABASE SmartBerry;
USE SmartBerry;

-- Tabelas ----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    dataNasc DATE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    cnpj CHAR(14) UNIQUE,
    telefonePessoal CHAR(11) NOT NULL,
    email VARCHAR(35) NOT NULL,
    cep CHAR(7) NOT NULL,
    nomeFantasia VARCHAR(50),
    numero VARCHAR(5),
    complemento VARCHAR(30),
    senha VARCHAR(15) NOT NULL
);

CREATE TABLE RegistroSensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    statusSensor VARCHAR(15) DEFAULT 'Inativo',
    localizacaoSensor VARCHAR(10) NOT NULL,
	dadoSensor FLOAT,
    dataHoraDadoSensor DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('Ativo' , 'Inativo', 'Em manutenção'))
);

CREATE TABLE Plantacao (
    idPlantacao INT PRIMARY KEY AUTO_INCREMENT,
    qtdMudasPlantada INT NOT NULL, 
    metrosQuadradosAreaPlantada INT NOT NULL,
    qtdColhida FLOAT, -- será inserido em kg
    dataPlantio DATE,
    dataColheita DATE,
    statusPlantacao VARCHAR(15),
    CONSTRAINT chkStatusPlantacao CHECK (statusPlantacao IN ('Em andamento' , 'Concluído'))
);

-- Insert ----------------------------------------------------------------------------------------------------------------------------

INSERT INTO Cliente (nome, dataNasc, cpf, cnpj, telefonePessoal, email, cep, nomeFantasia, numero, complemento, senha) VALUES 
('Carlos Almeida', '1984-11-10', '11223344556', '15012347000111', '11922334455', 'carlos.almeida@gmail.com', 'abc1234', 'Frutas do Carlos', '130', 'Próximo à Fazenda Santa Rita', 'senha001'),
('Mariana Ferreira', '1990-06-15', '99887766544', '04098763000120', '11988776654', 'mariana.ferreira@hotmail.com', '4321098', 'Frutas Ferreira', '45', 'Ao lado da Lagoa Verde', 'senha1234'),
('Ricardo Santos', '1982-02-28', '45678998765', NULL, '11976543210', 'ricardo.santos@gmail.com', '9876543', 'Morangos Santos', '92', 'Em frente ao Vale Azul', 'senha4321'),
('Sofia Lima', '1997-10-22', '71324658900', NULL, '11965432123', 'sofia.lima@outlook.com', '5678901', 'Lima Agro', '75', 'Próximo à Serra Negra', 'senha5678'),
('Eduardo Rocha', '1998-07-14', '32165498702', NULL, '11876543212', 'eduardo.rocha@gmail.com', '6543210', 'Rocha Produções', '200', 'No alto da Colina Dourada', 'senha6789');


INSERT INTO RegistroSensor (statusSensor, localizacaoSensor, dadoSensor, dataHoraDadoSensor) VALUES
('Ativo', 'canteiro6', '25.3', '2025-03-12 10:00:00'),
('Inativo', 'canteiro7', '48.2', '2025-03-12 10:15:00'),
('Em manutenção', 'canteiro8', '58.9', '2025-03-12 10:30:00'),
('Ativo', 'canteiro9', '70.4', '2025-03-12 10:45:00'),
('Ativo', 'canteiro10', '85.1', '2025-03-12 11:00:00');


INSERT INTO Plantacao (qtdMudasPlantada, metrosQuadradosAreaPlantada, qtdColhida, dataPlantio, dataColheita, statusPlantacao) VALUES 
(800, 3200, 9.5, '2021-11-10', '2022-05-15', 'Concluído'),
(650, 2300, 7.8, '2022-09-05', '2023-03-10', 'Concluído'),
(520, 1200, 5.4, '2023-07-01', '2024-05-05', 'Concluído'),
(690, 2100, NULL, '2024-05-15', NULL, 'Em andamento'),
(780, 2800, NULL, '2025-08-30', NULL, 'Em andamento');

-- Select ----------------------------------------------------------------------------------------------------------------------------

select * from Cliente;
select * from RegistroSensor;
select * from Plantacao;

-- Alter Table ----------------------------------------------------------------------------------------------------------------------------

alter table Plantacao modify column statusPlantacao VARCHAR(20);
describe Plantacao;

-- Update ----------------------------------------------------------------------------------------------------------------------------

update RegistroSensor set localizacaoSensor = 'canteiro9' where idSensor = 1;
select idSensor, localizacaoSensor from RegistroSensor where idSensor = 1;
