CREATE DATABASE IF NOT EXISTS bibliotech;
USE bibliotech;

CREATE TABLE alunos (
    matricula VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Disponível'
);

CREATE TABLE emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula_aluno VARCHAR(20),
    id_livro INT,
    data_devolucao DATE NOT NULL,
    FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula),
    FOREIGN KEY (id_livro) REFERENCES livros(id)
);

-- Cadastrando a lista de Alunos da Biblioteca Dom Malan
INSERT INTO alunos (matricula, nome) VALUES 
('20260001', 'Ana Silva'),
('20260002', 'Bruno Souza'),
('20260003', 'Carlos Eduardo'),
('20260004', 'Diana Prince'),
('20260005', 'Everton Ribeiro'),
('20260006', 'Fernanda Montenegro');

-- Cadastrando o acervo inicial de Livros
INSERT INTO livros (id, titulo, autor, category, status) VALUES 
(1, 'Cálculo I', 'James Stewart', 'Exatas', 'Disponível'),
(2, 'Dom Casmurro', 'Machado de Assis', 'Literatura', 'Disponível'),
(3, 'O Alquimista', 'Paulo Coelho', 'Literatura', 'Disponível'),
(4, 'A Garota no Trem', 'Paula Hawkins', 'Suspense', 'Disponível'),
(5, 'Uma Breve História do Tempo', 'Stephen Hawking', 'Ciência', 'Disponível'),
(6, 'Design de Interação', 'Jenny Preece', 'Tecnologia', 'Disponível'),
(7, 'Introdução à Programação com Python', 'Nilo Ney', 'Tecnologia', 'Disponível'),
(8, 'O Cortiço', 'Aluísio Azevedo', 'Literatura', 'Disponível'),
(9, 'Frankenstein', 'Mary Shelley', 'Terror', 'Disponível'),
(10, 'Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 'História', 'Disponível');

-- Registrando o histórico de Empréstimos ativos
INSERT INTO emprestimos (matricula_aluno, id_livro, data_devolucao) VALUES 
('20260001', 2, '2026-06-15'), -- Ana pegou Dom Casmurro
('20260003', 4, '2026-06-20'), -- Carlos pegou A Garota no Trem
('20260004', 7, '2026-06-25'), -- Diana pegou Python
('20260002', 10, '2026-06-18'); -- Bruno pegou Sapiens

-- (Mudando status dos livros emprestados)
UPDATE livros SET status = 'Emprestado' WHERE id IN (2, 4, 7, 10);
