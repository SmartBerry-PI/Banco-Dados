create database Plantação;
use Plantação;

create table Cliente (
idcliente int primary key auto_increment,
nomeCliente varchar(45) not null,
dataNascCliente date not null,
cpfCliente varchar(20), 
cnpjCliente varchar(45),
telefoneCliente varchar(11) not null,
emailCliente varchar(45) not null,
estadoCliente varchar(45),
cepCliente varchar(10) not null,
complemtentoCliente varchar(4),
senhaCliente varchar(20) not null
);

create table Sensor (
idSensor int primary key auto_increment,
nomeSensor varchar(40) not null,
localizacaoSensor varchar(45) not null,
dadoSensor varchar(45) not null
);

create table Fruta (
idFruta int primary key auto_increment,
nomeFruta varchar(45),
dataPlantio date not null,
dataColheita date not null,
qtdPlantio varchar(45) not null,
qtdColheita varchar(45) not null
);
