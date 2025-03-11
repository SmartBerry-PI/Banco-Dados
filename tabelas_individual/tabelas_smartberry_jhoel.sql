-- criaando o banco de dados para o projeto de pi smartberry feita por jhoel 
create database SmartBerry;
use SmartBerry;
-- criando uma tabela cliente onde serão armazenadas as informações do cliente para o cadastro e login
create table Cliente(
	idCliente int primary key auto_increment, -- id automatico incrementativo
    nome varchar(60) not null, 
    cpf varchar(14) not null, -- XXX.XXX.XXX-XX contando as pontuações
    cnpj varchar(18) not null, -- XX.XXX.XXX/0001-XX contando as pontuações
    telefone varchar(14),  -- (XX) XXXX-XXXX contando as pontuações
    email varchar(40) not null,  
    dataNasc date not null, 
    estado varchar(30) not null, 
    cep varchar(9) not null, -- XXXXX-XXX contando as pontuações
    numero varchar(15) not null,  -- (XX) XXXXX-XXXX contando as pontuações
    senha varchar(40) not null, 
    confSenha varchar(40) not null -- aqui deveria ter uma confirmação se é a mesma senha
    );
create table Sensor(
	idSensor int primary key auto_increment, -- id automatico incrementativo
    localSensor varchar(60) not null, -- onde o sensor está 
    dtInstalação date not null, -- quando foi instalado
    statusSensor varchar(20) not null, -- como o sensor está
    dadoSensor varchar(10),  -- dado coletado pelo sensor
    constraint chkStatus check(statusSensor in ('ativo', 'inativo'))
    );
    
create table Fruta(
	idFruta int primary key auto_increment, -- id automatico incrementativo
    nome varchar(30) default 'Morango' not null, -- nome da fruta caso não colocar nada será prenchido automatico com Morango
    peso float, -- peso da fruta em gramas
    dtColheita date, -- data da colheita
    producaoTotalSafra int, -- Quanto no total foi cultivado nessa safra
    idSensor int  -- id do sensor que estará com este morango
    ); 
    
    