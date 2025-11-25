-- ==========================================================
-- SCRIPT DE CRIAÇÃO DA ESTRUTURA (DDL)
-- ==========================================================

-- 1. Criação da Tabela ALUNO
CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- 2. Criação da Tabela FUNCIONARIO
CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL
);

-- 3. Criação da Tabela LIVRO
CREATE TABLE Livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editora VARCHAR(50),
    ano_publicacao INT,
    status VARCHAR(20) DEFAULT 'Disponível'
);

-- 4. Criação da Tabela EMPRESTIMO
-- (Criada por último pois depende das chaves das tabelas anteriores)
CREATE TABLE Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_livro INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    data_devolucao_real DATE, -- Pode ser NULL até o livro ser devolvido
    
    -- Chaves Estrangeiras (Relacionamentos)
    CONSTRAINT fk_emprestimo_aluno FOREIGN KEY (id_aluno) 
        REFERENCES Aluno (id_aluno),
    CONSTRAINT fk_emprestimo_livro FOREIGN KEY (id_livro) 
        REFERENCES Livro (id_livro),
    CONSTRAINT fk_emprestimo_funcionario FOREIGN KEY (id_funcionario) 
        REFERENCES Funcionario (id_funcionario)
);