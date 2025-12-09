/*  
Alunos
* um identificador único para cada aluno (numérico, chave primária, gerado automaticamente);
* nome completo do aluno (texto, obrigatório);
* série/ano escolar do aluno (texto, obrigatório);
* data de nascimento (data).

Livros
* um identificador único para cada livro (numérico, chave primária, gerado automaticamente);
* título do livro (texto, obrigatório);
* nome do autor (texto);
* ano de publicação (número inteiro);
* categoria/tema do livro (texto).

  Empréstimos
* um identificador do empréstimo (numérico, chave primária, gerado automaticamente);
* coluna que referencia qual aluno fez o empréstimo (chave estrangeira para a tabela Alunos, obrigatório);
* coluna que referencia qual livro foi emprestado (chave estrangeira para a tabela Livros, obrigatório);
* data em que o livro foi emprestado (data, obrigatório);
* data prevista para devolução (data);
* data efetiva da devolução (data, pode ser nula já que o aluno pode não ter devolvido ainda).

Insira pelo menos:
* 5 alunos
* 5 livros
* 10 empréstimos

Consultas Simples
Listar todos os alunos cadastrados.
Listar todos os livros.
Listar todos os empréstimos.

Consultas com filtro
Mostrar todos os empréstimos feitos por um aluno específico.
Mostrar todos os livros de uma determinada categoria.
*/

CREATE TABLE alunos (
	id_aluno serial PRIMARY KEY,
	nome_completo varchar (150) NOT NULL,
	serie_aluno char (6) NOT NULL,
	data_nasc date
);

CREATE TABLE livros (
	id_livro serial PRIMARY KEY,
	titulo varchar (200) NOT null,
	autor varchar (200) DEFAULT 'Não Identificado',
	ano_publi int,
	tema varchar (50)
);

CREATE TABLE emprestimos (
	id_emp serial PRIMARY KEY,
	aluno int REFERENCES alunos (id_aluno) NOT null,
	livro int REFERENCES livros (id_livro) NOT NULL,
	data_emp date DEFAULT current_date NOT null ,
	dev_previsao date,
	devolucao date
);

insert into alunos (nome_completo, serie_aluno, data_nasc)	
	values 
		('Enzo Gabriel da Silva', '6º Ano', '10/11/2014'),
		('Noah da Conceição', '7º Ano', '03/06/2013'),
		('Maria Eduarda dos Santos', '6º Ano', '01/10/2013'),
		('Helena Fernandes Ferreira', '8º Ano', '05/06/2010'),
		('João Marcos Cezario', '9º Ano', '13/08/2012');
		
insert into livros (titulo, autor, ano_publi, tema)
	values
		('As Aventuras de Sherlock Holmes', 'Arthur Conan Doyle', 1892, 'Mistério'),
    	('Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 1997, 'Aventura'),
    	('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 'Filosofia'),
    	('O Leão, a Feiticeira e o Guarda-Roupa', 'C. S. Lewis', 1950, 'Fantasia'),
    	('O Saci', 'Monteiro Lobato', 1921, 'Folclore');
    	
insert into emprestimos (aluno, livro, data_emp, dev_previsao, devolucao)
	values
		(1, 5, '10/03/2025', '17/03/2025', '16/03/2025'),
		(2, 3, '01/04/2025', '08/04/2025', '10/04/2025'),
		(5, 2, '25/04/2025', '02/05/2025', null),
		(3, 4, '03/06/2025', '10/06/2025', '10/07/2025'),
		(4, 1, '17/04/2025', '24/04/2025', null),
		(3, 3, '23/06/2025', '30/06/2025', '01/07/2025'),
		(5, 1, '03/07/2025', '10/07/2025', '10/07/2025'),
		(1, 2, '12/07/2025', '19/07/2025', '18/07/2025'),
		(4, 5, '03/08/2025', '10/08/2025', '31/08/2025'),
		(2, 4, '14/08/2025', '21/08/2025', null);
	
SELECT * FROM alunos;

SELECT * FROM livros;

SELECT * FROM emprestimos;
 