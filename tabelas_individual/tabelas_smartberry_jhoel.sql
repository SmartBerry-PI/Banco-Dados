-- grupo 4 o script oficial da smartberry foi mandado pelo aluno andre leao🦁
-- criaando o banco de dados para o projeto de pi smartberry feita por jhoel 
create database SmartBerry;
use SmartBerry;
-- criando uma tabela cliente onde serão armazenadas as informações do cliente para o cadastro e login
create table Usuario(
	idUsuario int primary key auto_increment, -- id automatico incrementativo
    nome varchar(60) not null, 
    cpf varchar(14) not null, -- XXX.XXX.XXX-XX contando as pontuações
    cnpj varchar(18) not null, -- XX.XXX.XXX/0001-XX contando as pontuações
    nomeFantasia varchar(50) not null, 
    telefone varchar(15),  -- (XX) XXXX-XXXX contando as pontuações
    email varchar(40) not null,  
    dataNasc date not null, 
    estado varchar(30) not null, 
    cep varchar(9) not null, -- XXXXX-XXX contando as pontuações
    numero varchar(15) not null,  -- (XX) XXXXX-XXXX contando as pontuações
    complemento varchar(30), 
    senha varchar(40) not null
    );
create table Sensor(
	idSensor int primary key auto_increment, -- id automatico incrementativo
    localSensor varchar(60) not null, -- onde o sensor está 
    dtInstalacao date not null, -- quando foi instalado
    statusSensor varchar(20) not null, -- como o sensor está
    dadoSensor varchar(10),  -- dado coletado pelo sensor
    horarioDadoSensor datetime default current_timestamp not null,
    constraint chkStatus check(statusSensor in ('ativo', 'inativo', 'manutenção'))
    );
    
create table Safra(
	idSafra int primary key auto_increment, -- id automatico incrementativo
    qtdMudasSafra int not null,
	qtdCanteiros int not null, 
    metrosQuadradosTotalUsado int not null, 
    qtdColhido int not null, 
    dataInicio date not null,
    dataFinal date not null,
    statusSafra varchar(15), 
    constraint chkStatusSafra check(statusSafra in ('Em andamento' , 'Concluído'))
    ); 

-- Inserindo dados na tabela Usuario
insert into Usuario (nome, cpf, cnpj, nomeFantasia, telefone, email, dataNasc, estado, cep, numero, complemento, senha) values
('João Silva', '123.456.789-00', '12.345.678/0001-00', 'AgroTech', '(11) 91234-5678', 'joao@email.com', '1985-06-15', 'São Paulo', '01000-000', '123', 'Apto 45', 'senha123'),
('Maria Souza', '987.654.321-00', '98.765.432/0001-99', 'BerryFarm', '(21) 92345-6789', 'maria@email.com', '1990-08-25', 'Rio de Janeiro', '22000-000', '456', 'Casa 2', 'senha456'),
('Carlos Mendes', '456.789.123-00', '45.678.912/0001-11', 'FreshStraw', '(31) 93456-7890', 'carlos@email.com', '1982-12-10', 'Minas Gerais', '33000-000', '789', NULL, 'senha789'),
('Ana Oliveira', '321.654.987-00', '32.165.498/0001-22', 'GreenField', '(41) 94567-8901', 'ana@email.com', '1995-03-30', 'Paraná', '44000-000', '101', 'Bloco B', 'senha101');

-- Inserindo dados na tabela Sensor
insert into Sensor (localSensor, dtInstalação, statusSensor, dadoSensor)values
('Canteiro 1', '2025-01-10', 'ativo', '75%'),
('Canteiro 2', '2025-01-15', 'inativo', '60%'),
('Canteiro 3', '2025-02-05', 'manutenção', '80%'),
('Canteiro 4', '2025-03-01', 'ativo', '65%');

-- Inserindo dados na tabela Safra
insert into Safra (qtdMudasSafra, qtdCanteiros, metrosQuadradosTotalUsado, qtdColhido, dataInicio, dataFinal, statusSafra) values
(500, 10, 200, 400, '2025-01-01', '2025-06-30', 'Em andamento'),
(700, 15, 300, 650, '2024-07-01', '2024-12-31', 'Concluído'),
(300, 5, 120, 280, '2025-02-15', '2025-07-15', 'Em andamento'),
(800, 20, 400, 750, '2024-03-01', '2024-08-31', 'Concluído');
    
-- selecionar todos os usuários cadastrados
select * from usuario;

-- selecionar nome, e-mail e telefone dos usuários
select nome, email, telefone from usuario;

-- selecionar sensores ativos
select * from sensor where statussensor = 'ativo';

-- selecionar sensores que estão em manutenção
select * from sensor where statussensor = 'manutenção';

-- selecionar todas as safras em andamento
select * from safra where statussafra = 'em andamento';

-- selecionar as safras concluídas ordenadas pela data final
select * from safra where statussafra = 'concluído' order by datafinal desc;

-- selecionar os dados mais recentes coletados pelos sensores
select * from sensor order by horariodadosensor desc limit 5;

-- selecionar os sensores instalados em uma data específica
select * from sensor where dtinstalação = '2025-01-10'; -- substituir pela data desejada

-- selecionar os usuários de um estado específico
select * from usuario where estado = 'são paulo'; -- substituir pelo estado desejado

-- Atualização do cnpj de dois usuario
update Usuario set cnpj = '11.111.111/0001-11' where idUsuario = 1;
update Usuario set cnpj = '22.222.222/0001-11' where idUsuario = 2;

-- select para mostrar uma tabela de sensor para o usuario 
select idSensor as 'ID', localSensor as 'LOCALIZAÇÃO DO SENSOR', dtInstalação as 'DATA DE INSTALAÇÃO', statusSensor as 'STATUS DO SENSOR', dadoSensor as 'DADO CAPTADO PELO SENSOR',
		horarioDadoSensor as 'HORARIO DO DADO CAPTADO' from Sensor;