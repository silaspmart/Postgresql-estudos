-- Criando uma nova tabela "cadastr_pessoas":

create table cadastro_pessoas (
	id_pessoa serial primary key, -- serial cria uma lista sequencial de numeros inteiros, identifica a coluna como chaveprimária
	nome varchar (100) not null, -- varchar para caracteres com um limite máximo, not null = obrigatório ter valor
	data_nasc date, -- formato de data
	altura int check (altura > 0),
	id_endereco int references enderecos (id_enderco), -- 'linka' com a tabe
	criado_em timestamp default current_timestamp -- informa data, hora minuto e segundo
);

-- Criando uma tabela "enderecos":

create table enderecos (
	id_enderco serial primary key,
	cep char(9)not null,
	rua varchar (100) not null,
	numero varchar (10),
	bairro varchar (30) not null,
	complemeto text,
	cidade varchar (30) not null,
	estado char (2) not null
);

ALTER TABLE enderecos
RENAME COLUMN id_enderco TO id_endereco;

insert into enderecos(cep, rua, bairro, cidade, estado) 
	values('25710265', 'Rua Luvercy Fiorini', 'Samambaia', 'Petrópolis', 'RJ');

alter table enderecos
alter column numero set default 'S/N';

insert into enderecos(cep, rua, bairro, cidade, estado) 
	values('25710260', 'Rua Aldo Tamancoldi', 'Alto da Serra', 'Petrópolis', 'RJ');

insert into enderecos(cep, rua, numero, bairro, complemeto, cidade, estado) 
	values('25716260', 'Rua do Imperador', 159, 'Centro', 'Apto 603', 'Petrópolis', 'RJ');
	
insert into cadastro_pessoas(nome,	id_endereco) 
	values('Silas', 2);
	
ALTER TABLE cadastro_pessoas
DROP CONSTRAINT cadastro_pessoas_id_endereco_fkey;

ALTER TABLE cadastro_pessoas
ADD CONSTRAINT cadastro_pessoas_id_endereco_fkey
FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco);

insert into enderecos(cep, rua, numero, bairro, complemeto, cidade, estado) 
	values('25700260', 'Rua A', 386, 'Duques', 'Fundos', 'Petrópolis', 'RJ');

insert into cadastro_pessoas(nome,	id_endereco) 
	values('Maria', 3);

insert into enderecos(cep, rua, numero, bairro, complemeto, cidade, estado) values
('25680010', 'Rua Teresa', '1200', 'Alto da Serra', 'Loja 03', 'Petrópolis', 'RJ'),
('25655020', 'Rua Avenida Ipiranga', '45', 'Centro', 'Sobrado', 'Petrópolis', 'RJ'),
('25715030', 'Rua Bingen', '310', 'Bingen', null, 'Petrópolis', 'RJ'),
('25725040', 'Rua Manuel Torres', 'S/N', 'Quitandinha', 'Próximo ao lago', 'Petrópolis', 'RJ'),
('25685050', 'Rua Dr. Porciúncula', '88', 'Centro', 'Apto 201', 'Petrópolis', 'RJ'),
('25730410', 'Rua Luiz Winter', '17', 'Itaipava', 'Casa 02', 'Petrópolis', 'RJ'),
('25716160', 'Rua do Imperador', '450', 'Centro', 'Edifício Solar', 'Petrópolis', 'RJ'),
('25660270', 'Rua Coronel Veiga', '102', 'Bingen', null, 'Petrópolis', 'RJ'),
('25730290', 'Rua Joaquim Agante Moço', '55', 'Itaipava', 'Fundos', 'Petrópolis', 'RJ'),
('25725680', 'Rua Haiti', 'S/N', 'Quitandinha', 'Próximo ao campo', 'Petrópolis', 'RJ');

insert into cadastro_pessoas (nome, data_nasc, altura, id_endereco) values
('Marcos Andrade', '1990-04-12', 178, 3),
('Fernanda Alves', '1988-09-23', 165, 4),
('Ricardo Moreira', '1995-01-05', 182, 5),
('Juliana Tavares', '1992-11-18', 160, 6),
('Paulo Henrique', '1986-07-29', 175, 7),
('Beatriz Costa', '1999-02-14', 168, 8),
('Carlos Eduardo', '1993-08-31', 183, 9),
('Larissa Monteiro', '2000-05-07', 170, 10),
('Gustavo Pinheiro', '1984-12-02', 177, 11),
('Amanda Rocha', '1997-03-22', 158, 12),
('Thiago Furlan', '1991-10-09', 181, 13),
('Natália Barbosa', '1996-06-15', 166, 14);
