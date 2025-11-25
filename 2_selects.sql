-- ==========================================================
-- SCRIPT 2: CONSULTAS (SELECT)
-- ==========================================================

-- Consulta 1: Listar todos os livros disponíveis para empréstimo
-- Objetivo: Mostrar para o usuário o que ele pode pegar agora.
SELECT titulo, autor, editora, ano_publicacao 
FROM Livro 
WHERE status = 'Disponível'
ORDER BY titulo ASC;

-- Consulta 2: Histórico de empréstimos de um aluno específico (JOIN)
-- Objetivo: Ver o que o aluno "Lucas Pereira" (ID 1) já pegou.
SELECT 
    A.nome AS Nome_Aluno,
    L.titulo AS Livro,
    E.data_retirada,
    E.data_devolucao_real
FROM Emprestimo E
JOIN Aluno A ON E.id_aluno = A.id_aluno
JOIN Livro L ON E.id_livro = L.id_livro
WHERE A.id_aluno = 1;

-- Consulta 3: Relatório de livros atualmente emprestados (quem está com o quê?)
-- Objetivo: Controle administrativo de ativos.
SELECT 
    L.titulo,
    A.nome AS Aluno_Responsavel,
    E.data_devolucao_prevista,
    F.nome AS Funcionario_Que_Emprestou
FROM Emprestimo E
JOIN Livro L ON E.id_livro = L.id_livro
JOIN Aluno A ON E.id_aluno = A.id_aluno
JOIN Funcionario F ON E.id_funcionario = F.id_funcionario
WHERE E.data_devolucao_real IS NULL
ORDER BY E.data_devolucao_prevista ASC
LIMIT 5;