-- Início dos Comandos DDL;
DROP INDEX dicionario_idx;
CREATE UNIQUE INDEX dicionario_idx ON dicionario(Tabela,Campo);
Analyse dicionario;
DROP INDEX formatosrel_idx;
CREATE UNIQUE INDEX formatosrel_idx ON formatosrel(Loja,Usuario,GrUsuario,NomeRel,NomeFormato);
Analyse formatosrel;
-- Final dos Comandos DDL;
