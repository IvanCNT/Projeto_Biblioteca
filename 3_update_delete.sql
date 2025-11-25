-- ==========================================================
-- SCRIPT 3: ATUALIZAÇÃO E EXCLUSÃO (UPDATE / DELETE)
-- ==========================================================

-- --- UPDATE (3 exemplos) ---

-- 1. Atualizar o telefone de um aluno
UPDATE Aluno 
SET telefone = '11955556666' 
WHERE id_aluno = 1;

-- 2. Alterar o status de um livro (Simulando devolução no cadastro do livro)
UPDATE Livro 
SET status = 'Disponível' 
WHERE id_livro = 3; -- Clean Code

-- 3. Registrar a devolução real no empréstimo (Complemento do anterior)
UPDATE Emprestimo 
SET data_devolucao_real = CURDATE() -- Data de hoje
WHERE id_livro = 3 AND data_devolucao_real IS NULL;


-- --- DELETE (3 exemplos) ---

-- 1. Excluir um livro que foi cadastrado errado e nunca foi emprestado
-- (Seguro de apagar pois não tem chave estrangeira vinculada em Emprestimo)
DELETE FROM Livro 
WHERE id_livro = 4; -- Domain Driven Design

-- 2. Excluir um funcionário demitido
-- Nota: Se ele já fez empréstimos, o banco pode bloquear. 
-- Idealmente, deletaríamos um funcionário novo sem histórico.
INSERT INTO Funcionario (nome, cargo) VALUES ('Funcionario Teste', 'Estagiário');
DELETE FROM Funcionario 
WHERE nome = 'Funcionario Teste';

-- 3. Cancelar um empréstimo feito por engano (Excluir registro de empréstimo)
-- Vamos supor que o empréstimo do livro 5 foi um erro de digitação.
DELETE FROM Emprestimo 
WHERE id_livro = 5 AND id_aluno = 1;

-- Ajuste de consistência: Voltar o status do livro 5 para disponível após deletar o empréstimo
UPDATE Livro SET status = 'Disponível' WHERE id_livro = 5;