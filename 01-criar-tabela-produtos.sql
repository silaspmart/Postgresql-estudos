-- Criar a Tabela: PRODUTOS

coluna id_produto: inteiro que incrementa automático, chave primária;
coluna nome: texto até 100 caracteres, não nulo;
coluna descricao: texto livre, pode ser nulo;
coluna codigo_barras: texto até 30 caracteres, deve ser único e deve ser não nulo;
coluna preco: decimal com 4 números sendo 2 números após a virgula, não nulo, com CHECK exigindo valor maior ou igual a 5;
coluna estoque: inteiro com valor padrão 0, não nulo, com CHECK exigindo valor maior ou igual a 0;
coluna ativo: booleano com valor padrão TRUE, não nulo;
coluna criado_em: tipo data e hora padrão NOW(), não nulo.

Inserir ao menos 5 registros nessa tabela;

create table produtos (
	id_produto serial primary key,
	nome varchar (100) not null,
	descricao text,
	codigo_barras varchar (30) unique not null,
	preco numeric (4,2) not null check (preco >= 5),
	estoque int default 0 check (estoque >= 0),
	ativo bool default true not null,	
	criado_em timestamp default now()
);

INSERT INTO produtos (nome, descricao, codigo_barras, preco, estoque)
VALUES
('Caderno A4 200 folhas', 'Caderno espiral universitário', '7891234500011', 15.90, 10),
('Caneta Azul', 'Caneta esferográfica azul', '7891234500028', 5.50, 100),
('Mouse USB', 'Mouse óptico USB 1600dpi', '7891234500035', 29.90, 25),
('Garrafa Térmica 500ml', 'Aço inox, mantém quente por 8h', '7891234500042', 45.00, 12),
('Fone de Ouvido', 'Intra-auricular com microfone', '7891234500059', 35.00, 30);