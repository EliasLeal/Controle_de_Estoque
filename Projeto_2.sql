/**
 *Projeto 2: Controle de estoque
 *Versão 1.0
 *@autor Elias Leal
 */
 show databases;
 create database dbconest;
 use dbconest;
 show tables;
 drop table estoque;
 
 /*
	unique -> impede valores duplicados no campo da tabela
    timestamp default current_timestamp -> data/hora automatico
    date -> Data no formato (YYYY/MM/DD)
    decimal(10,2) (digitos, casa decimais) -> tipo numerico real
    
    Formatando e realizando operações no banco de dados
    para formatar uma data usamos a função:
    date_format(campo, formato)
    Formato '%d%m%y' (dia,mês e ano com 2 digitos)
    Formato '%d%m%Y' (dia,mês e ano com 4 digitos)
    sum() -> função usada para somar valores numericos
    datediff(data1,data2) -> função usada para obter a diferença em dias entre datas
    curdate() -> função usada para obter a data atual
*/

 create table estoque(
	codigo int primary key auto_increment, 
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    quantidade int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    localizacao varchar(100)
);

describe estoque;

-- Inserir fabricante 

insert into estoque
(barcode,produto,fabricante,dataval,quantidade,estoquemin,medida,valor,localizacao)
values
('11111111','Regua, 30cm','Faber Castel','20230531',50,20,'unidade',2.35,'Setor B');

insert into estoque
(barcode,produto,fabricante,dataval,quantidade,estoquemin,medida,valor,localizacao)
values
('22222222','Caneta, cx 50','Bic','20220531',15,30,'unidade',17,'Setor A');

insert into estoque
(barcode,produto,fabricante,dataval,quantidade,estoquemin,medida,valor,localizacao)
values
('33333333','Grampeador','Singer','20220531',23,70,'unidade',10,'Setor C');

insert into estoque
(barcode,produto,fabricante,dataval,quantidade,estoquemin,medida,valor,localizacao)
values
('44444444','Sulfite','Chamex','20220531',100,70,'unidade',10,'Setor A');

insert into estoque
(barcode,produto,fabricante,dataval,quantidade,estoquemin,medida,valor,localizacao)
values
('55555555','Cola Bastão','Bic','20220531',50,70,'unidade',5,'Setor A');


-- Cread update
update estoque set produto='Borracha Dust Free', quantidade=155, 
estoquemin=5 where barcode='33333333';

-- Cread Delete

delete from estoque where barcode='88888888';

select * from estoque;

-- Executando operações matematicas no select (inventario)

select sum(valor * quantidade)as Total from estoque;

-- Relatório de reposição de estoque 1

select * from estoque where quantidade < estoquemin;

-- Relatório de reposição de estoque 2

select codigo as código,produto,
date_format(dataval,'%d%m%Y') as data_validade,
quantidade, estoquemin as estoque_minímo
from estoque where quantidade < estoquemin;

-- Relatório de controle de validade 1

select codigo,produto,
date_format(dataval,'%d%m%Y') as data_validade
from estoque;

-- Relatório de validade 2

select codigo,produto,
date_format(dataval,'%d%m%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes
from estoque order by dataval desc;




-- Formatandi a data/hora e mudando os nome dos campos(apelidos)
/*
	Para formatar uma data usamos a função date_format
    date_format(campo,formato)
    Formato '%d%m%y' (dia, mes e ano com 2 digitos)
    Formato '%d%m%Y' (dia, mes e ano com 2 digitos)
*/
 
 select codigo as código, barcode, produto, fabricante,
 date_format(datacad,'%d%m%Y') as data_cadastro,
 dataval as data_validade, quantidade, 
 estoquemin as estoque_minimo, medida, valor,
 localizacao as localização from estoque order by produto;