-- ==========================================================
-- SCRIPT 1: POVOAMENTO DE DADOS (INSERT)
-- ==========================================================

-- 1. Inserindo Funcionários
INSERT INTO Funcionario (nome, cargo) VALUES 
('Carlos Souza', 'Bibliotecário Chefe'),
('Ana Paula', 'Assistente Administrativo'),
('Roberto Santos', 'Atendente');

-- 2. Inserindo Alunos
INSERT INTO Aluno (nome, matricula, email, telefone) VALUES 
('Lucas Pereira', '2023001', 'lucas.p@uni.edu.br', '11999991111'),
('Fernanda Lima', '2023002', 'fernanda.l@uni.edu.br', '11988882222'),
('João Silva', '2023003', 'joao.silva@uni.edu.br', '11977773333'),
('Mariana Costa', '2023004', 'mari.costa@uni.edu.br', '11966664444');

-- 3. Inserindo Livros
INSERT INTO Livro (titulo, autor, editora, ano_publicacao, status) VALUES 
('Engenharia de Software', 'Roger Pressman', 'McGraw Hill', 2016, 'Disponível'),
('Sistemas de Banco de Dados', 'Elmasri & Navathe', 'Pearson', 2018, 'Disponível'),
('Clean Code', 'Robert C. Martin', 'Alta Books', 2009, 'Emprestado'),
('Domain Driven Design', 'Eric Evans', 'Alta Books', 2011, 'Disponível'),
('Algoritmos: Teoria e Prática', 'Thomas Cormen', 'Elsevier', 2012, 'Emprestado');

-- 4. Inserindo Empréstimos (Simulando histórico e ativos)
-- Nota: Os IDs dependem da ordem de inserção acima (AUTO_INCREMENT).
-- Assumindo: Clean Code (ID 3) e Algoritmos (ID 5) estão emprestados.

INSERT INTO Emprestimo (id_aluno, id_livro, id_funcionario, data_retirada, data_devolucao_prevista, data_devolucao_real) VALUES 
-- Empréstimo já devolvido (Histórico)
(1, 1, 3, '2025-10-01', '2025-10-15', '2025-10-14'),
-- Empréstimo Ativo (Livro 3 - Clean Code com Aluno 2)
(2, 3, 1, '2025-11-20', '2025-12-05', NULL),
-- Empréstimo Ativo (Livro 5 - Algoritmos com Aluno 1)
(1, 5, 2, '2025-11-22', '2025-12-07', NULL);