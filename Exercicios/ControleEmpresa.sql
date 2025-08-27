SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Banco de Dados: `Controle Empresa`
CREATE DATABASE CONTROLEEMPRESA;
USE CONTROLEEMPRESA;
-- 

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `departamento`
-- 

CREATE TABLE `departamento` (
  `CODIGO` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(60) NOT NULL,
  `ENDERECO` varchar(30) default NULL,
  `ORCAMENTO` double(9,2) default NULL,
  `GERENTECPF` char(14) default NULL,
  `DATAINICIO` date default NULL,
  PRIMARY KEY  (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=556 ;

-- 
-- Extraindo dados da tabela `departamento`
-- 

INSERT INTO `departamento` (`CODIGO`, `NOME`, `ENDERECO`, `ORCAMENTO`, `GERENTECPF`, `DATAINICIO`) VALUES 
(111, 'Informatica         ', 'Rua X, 33                     ', 150000.00, '111.111.111-11', '2011-01-01'),
(222, 'Manutencao          ', 'Rua Y, 44                     ', 100000.00, '444.444.444-44', '2011-10-20'),
(333, 'Marketing           ', 'Rua Z, 55                     ', 75000.00, '666.666.666-66', '2011-02-13'),
(444, 'Financeiro          ', 'Rua W, 93                     ', 32000.00, '888.888.888-88', '2011-07-17'),
(555, 'Pesquisa            ', 'Rua X, 99                     ', 130000.00, '000.000.000-00', '2011-05-25');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `dependente`
-- 

CREATE TABLE `dependente` (
  `CODIGO` int(10) unsigned NOT NULL auto_increment,
  `EMPREGADOCPF` char(14) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `PARENTESCO` char(10) default NULL,
  `SEXO` char(1) default NULL,
  PRIMARY KEY  (`CODIGO`),
  KEY `EMPREGADOCPF` (`EMPREGADOCPF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- 
-- Extraindo dados da tabela `dependente`
-- 

INSERT INTO `dependente` (`CODIGO`, `EMPREGADOCPF`, `NOME`, `PARENTESCO`, `SEXO`) VALUES 
(1, '111.111.111-11', 'Ana Maria           ', 'Conjuge', 'F'),
(2, '111.111.111-11', 'Pedro Henrique      ', 'Filho', 'M'),
(3, '111.111.111-11', 'Carla Cristina      ', 'Filho', 'F'),
(4, '333.333.333-33', 'Andre‚ Junior        ', 'Filho', 'M'),
(5, '333.333.333-33', 'Maria das Dores     ', 'Mae', 'F'),
(6, '888.888.888-88', 'Jose‚ Calos          ', 'Conjuge', 'M'),
(7, '888.888.888-88', 'Tiago Silva         ', 'Filho', 'M'),
(8, '888.888.888-88', 'Junia Silva         ', 'Filho', 'F'),
(9, '888.888.888-88', 'Mateus Silva        ', 'Filho', 'M');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `empregado`
-- 

CREATE TABLE `empregado` (
  `CPF` char(14) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `SALARIO` double(9,2) default NULL,
  `SEXO` char(1) default NULL,
  `DEPTO` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`CPF`),
  KEY `DEPTO` (`DEPTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `empregado`
-- 

INSERT INTO `empregado` (`CPF`, `NOME`, `SALARIO`, `SEXO`, `DEPTO`) VALUES 
('000.000.000-00', 'Carlos Henrique     ', 15000.00, 'M', 555),
('000.111.111-11', 'Antonio Pereira     ', 3000.00, 'M', 111),
('000.222.222-22', 'Patricia de Souza   ', 550.00, 'F', 444),
('000.333.333-33', 'Leandro Figueira    ', 9300.00, 'M', 555),
('111.111.111-11', 'Joao Carlos         ', 7500.00, 'M', 111),
('222.222.222-22', 'Antonio Henrique    ', 5000.00, 'M', 111),
('333.333.333-33', 'Andre‚ da Silva      ', 700.00, 'M', 222),
('444.444.444-44', 'Gustavo de Moura    ', 900.00, 'M', 222),
('555.555.555-55', 'Manoel Junior       ', 1400.00, 'M', 333),
('666.666.666-66', 'Felipe Arantes      ', 2100.00, 'M', 333),
('777.777.777-77', 'Gabriel Araujo      ', 1300.00, 'M', 444),
('888.888.888-88', 'Leticia Carolina    ', 1000.00, 'F', 444),
('999.999.999-99', 'Ana Cecilia         ', 12000.00, 'F', 555);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `participa`
-- 

CREATE TABLE `participa` (
  `EMPREGADO` char(14) NOT NULL,
  `PROJETO` int(10) unsigned NOT NULL,
  `HORAS` int(11) default NULL,
  PRIMARY KEY  (`EMPREGADO`,`PROJETO`),
  KEY `PROJETO` (`PROJETO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `participa`
-- 

INSERT INTO `participa` (`EMPREGADO`, `PROJETO`, `HORAS`) VALUES 
('111.111.111-11', 111, 20),
('111.111.111-11', 222, 10),
('111.111.111-11', 444, 5),
('111.111.111-11', 666, 5),
('222.222.222-22', 222, 5),
('333.333.333-33', 222, 17),
('333.333.333-33', 333, 3),
('444.444.444-44', 555, 15);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `projeto`
-- 

CREATE TABLE `projeto` (
  `CODIGO` int(10) unsigned NOT NULL auto_increment,
  `NOME` varchar(50) NOT NULL,
  `ENDERECO` varchar(30) default NULL,
  `ORCAMENTO` double(9,2) default NULL,
  `DEPTO` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`CODIGO`),
  KEY `DEPTO` (`DEPTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=667 ;

-- 
-- Extraindo dados da tabela `projeto`
-- 

INSERT INTO `projeto` (`CODIGO`, `NOME`, `ENDERECO`, `ORCAMENTO`, `DEPTO`) VALUES 
(111, 'Alfa                ', 'Rua X, 23                     ', 12000.00, 111),
(222, 'Beta                ', 'Rua Y, 78                     ', 2000.00, 111),
(333, 'Gama                ', 'Rua Z, 94                     ', 7500.00, 111),
(444, 'Delta               ', 'Rua W, 2002                   ', 4375.00, 555),
(555, 'Omega               ', 'Rua T, 2006                   ', 5300.00, 555),
(666, 'Zeta                ', 'Rua W, 32                     ', 4500.00, 555);

-- 
-- Restrições para as tabelas dumpadas
-- 

-- 
-- Restrições para a tabela `dependente`
-- 
ALTER TABLE `dependente`
  ADD CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`EMPREGADOCPF`) REFERENCES `empregado` (`CPF`);

-- 
-- Restrições para a tabela `empregado`
-- 
ALTER TABLE `empregado`
  ADD CONSTRAINT `empregado_ibfk_1` FOREIGN KEY (`DEPTO`) REFERENCES `departamento` (`CODIGO`),
  ADD CONSTRAINT `empregado_ibfk_2` FOREIGN KEY (`DEPTO`) REFERENCES `departamento` (`CODIGO`);

-- 
-- Restrições para a tabela `participa`
-- 
ALTER TABLE `participa`
  ADD CONSTRAINT `participa_ibfk_1` FOREIGN KEY (`EMPREGADO`) REFERENCES `empregado` (`CPF`),
  ADD CONSTRAINT `participa_ibfk_2` FOREIGN KEY (`EMPREGADO`) REFERENCES `empregado` (`CPF`),
  ADD CONSTRAINT `participa_ibfk_3` FOREIGN KEY (`PROJETO`) REFERENCES `projeto` (`CODIGO`);

-- 
-- Restrições para a tabela `projeto`
-- 
ALTER TABLE `projeto`
  ADD CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`DEPTO`) REFERENCES `departamento` (`CODIGO`);
  
-- 1) Qual o nome de cada empregado e a quantidade de projetos em que trabalha?

DESC EMPREGADO;
DESC PARTICIPA;
SELECT * FROM PARTICIPA;

SELECT DISTINCT EMPREGADO.NOME AS EMPREGADO, (SELECT COUNT(*) FROM PARTICIPA WHERE PARTICIPA.EMPREGADO = EMPREGADO.CPF) AS PROJETOS
FROM EMPREGADO JOIN PARTICIPA
ON PARTICIPA.EMPREGADO = EMPREGADO.CPF;

-- 2) Qual o nome de cada empregado e o total de horas semanais em que ele trabalha em projetos?

SELECT DISTINCT EMPREGADO.NOME AS EMPREGADO, (SELECT SUM(HORAS) FROM PARTICIPA WHERE PARTICIPA.EMPREGADO = EMPREGADO.CPF) AS PROJETOS
FROM EMPREGADO JOIN PARTICIPA
ON PARTICIPA.EMPREGADO = EMPREGADO.CPF;

-- 3) Qual o nome de cada projeto com o total de horas semanais em que os empregados trabalham nesse projeto?

DESC PROJETO;

SELECT DISTINCT PROJETO.NOME AS PROJETO, (SELECT SUM(HORAS) FROM PARTICIPA WHERE PARTICIPA.PROJETO = PROJETO.CODIGO) AS HORAS_TRABALHADAS
FROM PROJETO JOIN PARTICIPA
ON PARTICIPA.PROJETO = PROJETO.CODIGO;

-- 4) Qual o nome e o salário dos empregados que trabalham em 2 ou mais projetos?

SELECT NOME, SALARIO 
FROM EMPREGADO
WHERE 2 <= ALL(
	SELECT COUNT(*) FROM PARTICIPA WHERE PARTICIPA.EMPREGADO = EMPREGADO.CPF
);

-- 5) Qual o nome de cada departamento, o nome do gerente e a quantidade de dependentes que o gerente possui?

DESC DEPARTAMENTO;
DESC EMPREGADO;
DESC DEPENDENTE;

SELECT DISTINCT DEPARTAMENTO.NOME AS DEPTO, EMPREGADO.NOME AS GERENTE, (SELECT COUNT(*) FROM DEPENDENTE WHERE DEPENDENTE.EMPREGADOCPF = EMPREGADO.CPF) AS DEPENDENTES_NUM
FROM DEPARTAMENTO JOIN EMPREGADO
ON DEPARTAMENTO.GERENTECPF = EMPREGADO.CPF
JOIN DEPENDENTE
WHERE EMPREGADO.CPF = ANY(
	SELECT EMPREGADOCPF FROM DEPENDENTE WHERE EMPREGADO.CPF = DEPENDENTE.EMPREGADOCPF
);

-- Porque somente dois departamentos apareceram no resultado se existem cinco?
-- O banco desconsidera valores nulos

-- 6) Qual o nome de cada departamento e o seu número de empregados?

SELECT * FROM PARTICIPA;

SELECT DISTINCT DEPARTAMENTO.NOME AS DEPARTAMENTO, (SELECT COUNT(*) FROM EMPREGADO WHERE EMPREGADO.DEPTO = DEPARTAMENTO.CODIGO) AS EMPREGADOS_NUM
FROM DEPARTAMENTO JOIN EMPREGADO
ON DEPARTAMENTO.CODIGO = EMPREGADO.DEPTO;

-- 7) Qual o nome e o endereço do departamento que possui o maior orçamento?

SELECT NOME, ENDERECO FROM DEPARTAMENTO HAVING MAX(ORCAMENTO);

-- 8) Qual o nome, o salário e o sexo dos empregados que não possuem dependentes, em ordem decrescente de salário?

SELECT NOME, SALARIO, SEXO
FROM EMPREGADO
WHERE CPF != ALL
	(SELECT EMPREGADOCPF FROM DEPENDENTE WHERE CPF = EMPREGADOCPF)
ORDER BY SALARIO DESC
;
