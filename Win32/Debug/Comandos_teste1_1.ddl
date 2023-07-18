-- Início dos Comandos DDL;
CREATE TABLE pessoa_fisica (
)
;
CREATE TABLE pessoas (
id_pess NUMERIC(8)
, nome VARCHAR(50)
, sobrenome VARCHAR(50)
, cpf VARCHAR(11)
, tipo_pessoa VARCHAR(1)
)
;
CREATE TABLE funcionarios (
id_func NUMERIC(8)
, id_func_pess NUMERIC(8)
)
;
DROP INDEX dicionario_idx;
CREATE UNIQUE INDEX dicionario_idx ON dicionario(Tabela,Campo);
Analyse dicionario;
DROP INDEX formatosrel_idx;
CREATE UNIQUE INDEX formatosrel_idx ON formatosrel(Loja,Usuario,GrUsuario,NomeRel,NomeFormato);
Analyse formatosrel;
-- Final dos Comandos DDL;
