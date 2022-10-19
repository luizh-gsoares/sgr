-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Out-2022 às 19:50
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sgr`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idEstado` int(2) NOT NULL COMMENT 'Chave estrangeira da tabela estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `idCidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `nome` text NOT NULL,
  `sigla` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`idEstado`, `nome`, `sigla`) VALUES
(1, 'Acre', 'AC'),
(2, 'Alagoas', 'AL'),
(3, 'Amazonas', 'AM'),
(4, 'Amapá', 'AP'),
(5, 'Bahia', 'BA'),
(6, 'Ceará', 'CE'),
(7, 'Distrito Federal', 'DF'),
(8, 'Espírito Santo', 'ES'),
(9, 'Goiás', 'GO'),
(10, 'Maranhão', 'MA'),
(11, 'Minas Gerais', 'MG'),
(12, 'Mato Grosso do Sul', 'MS'),
(13, 'Mato Grosso', 'MT'),
(14, 'Pará', 'PA'),
(15, 'Paraíba', 'PB'),
(16, 'Pernambuco', 'PE'),
(17, 'Piauí', 'PI'),
(18, 'Paraná', 'PR'),
(19, 'Rio de Janeiro', 'RJ'),
(20, 'Rio Grande do Norte', 'RN'),
(21, 'Rondônia', 'RO'),
(22, 'Roraima', 'RR'),
(23, 'Rio Grande do Sul', 'RS'),
(24, 'Santa Catarina', 'SC'),
(25, 'Sergipe', 'SE'),
(26, 'São Paulo', 'SP'),
(27, 'Tocantins', 'TO'),
(99, 'Exterior', 'EX');

-- --------------------------------------------------------

--
-- Estrutura da tabela `experiencia`
--

CREATE TABLE `experiencia` (
  `idExperiencia` int(11) NOT NULL,
  `funcao` varchar(50) DEFAULT NULL,
  `dtSaida` date DEFAULT NULL,
  `dtEntrada` date DEFAULT NULL,
  `matricula_empregado` int(11) NOT NULL,
  `cargo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `experiencia`
--

INSERT INTO `experiencia` (`idExperiencia`, `funcao`, `dtSaida`, `dtEntrada`, `matricula_empregado`, `cargo`) VALUES
(1, 'Vendedor de coxinha', '2022-10-17', '1900-01-07', 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `formacao`
--

CREATE TABLE `formacao` (
  `idFormacao` int(11) NOT NULL,
  `tipoCurso` int(11) NOT NULL,
  `curso` varchar(20) NOT NULL,
  `instituicao` varchar(20) NOT NULL,
  `dtInicio` date NOT NULL,
  `dtFim` date DEFAULT NULL,
  `tipoSituacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcao`
--

CREATE TABLE `funcao` (
  `idFuncao` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `dt_inativacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcao`
--

INSERT INTO `funcao` (`idFuncao`, `tipo`, `dt_inativacao`) VALUES
(1, 'Docente', NULL),
(2, 'Tradutor e Intérprete de Libras', NULL),
(3, 'Guia-Intérprete', NULL),
(4, 'Auxiliar / assistente educacional', NULL),
(6, 'Docente titular - coordenador(a) de tutoria (de módulo ou disciplina) - EaD', NULL),
(7, 'Profissional de apoio escoalr para alunos com deficiência (Lei 13.146/2015)', NULL),
(8, 'Profissional / monitor de atividade complementar', NULL),
(9, 'Docente tutor - auxiliar (de módulo ou disciplina) - EaD', NULL),
(10, 'Instrutor de educação profissional', NULL),
(11, 'Outros', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lotacao`
--

CREATE TABLE `lotacao` (
  `idLotacao` int(11) NOT NULL,
  `tempo` int(2) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `dt_inativacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `idTelefone` int(11) NOT NULL,
  `matricula_empregado` int(11) NOT NULL COMMENT 'Chave estrangeira da tabela empregado.',
  `telefoneResidencial` int(11) DEFAULT NULL,
  `telefoneCelular` int(11) NOT NULL,
  `telefoneRecado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipocurso`
--

CREATE TABLE `tipocurso` (
  `idTipoCurso` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `dt_inativacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipocurso`
--

INSERT INTO `tipocurso` (`idTipoCurso`, `nome`, `dt_inativacao`) VALUES
(1, 'Ensino Fundamental Interrompido', NULL),
(2, 'Ensino Fundamental Cursando', NULL),
(3, 'Ensino Fundamental Completo', NULL),
(4, 'Ensino Médio Regular Interrompido', NULL),
(5, 'Ensino Médio Regular Cursando', NULL),
(6, 'Ensino Médio Regular Completo', NULL),
(7, 'Ensino Médio Profissionalizante Interrompido', NULL),
(8, 'Ensino Médio Profissionalizante Cursando', NULL),
(9, 'Ensino Médio Profissionalizante Concluído', NULL),
(10, 'Graduação Interrompido', NULL),
(11, 'Graduação Cursando', NULL),
(12, 'Graduação Concluído', NULL),
(13, 'Pós-Graduação Especialização - Interrompido', NULL),
(14, 'Pós-Graduação Especialização - Cursando', NULL),
(15, 'Pós-Graduação Especialização - Concluído', NULL),
(16, 'Pós-Graduação MBA - Interrompido', NULL),
(17, 'Pós-Graduação MBA - Cursando', NULL),
(18, 'Pós-Graduação MBA - Concluído', NULL),
(19, 'Pós-Graduação Mestrado - Interrompido', NULL),
(20, 'Pós-Graduação Mestrado - Cursando', NULL),
(21, 'Pós-Graduação Mestrado - Concluído', NULL),
(22, 'Pós-Graduação Doutorado - Interrompido', NULL),
(23, 'Pós-Graduação Doutorado - Cursando', NULL),
(24, 'Pós-Graduação Doutorado - Concluído', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiporegime`
--

CREATE TABLE `tiporegime` (
  `idRegime` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `dt_inativacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tiporegime`
--

INSERT INTO `tiporegime` (`idRegime`, `tipo`, `dt_inativacao`) VALUES
(1, 'Concursado / Efetivo / Estável', NULL),
(2, 'Contrato temporário', NULL),
(3, 'Contrato terceirizado', NULL),
(4, 'Contrato CLT', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`idCidade`),
  ADD KEY `idEstado_id` (`idEstado`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idEndereco`),
  ADD KEY `cidade_id` (`idCidade`);

--
-- Índices para tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Índices para tabela `experiencia`
--
ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`idExperiencia`);

--
-- Índices para tabela `formacao`
--
ALTER TABLE `formacao`
  ADD PRIMARY KEY (`idFormacao`),
  ADD KEY `tipo_curso_id` (`tipoCurso`);

--
-- Índices para tabela `funcao`
--
ALTER TABLE `funcao`
  ADD PRIMARY KEY (`idFuncao`);

--
-- Índices para tabela `lotacao`
--
ALTER TABLE `lotacao`
  ADD PRIMARY KEY (`idLotacao`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`idTelefone`);

--
-- Índices para tabela `tipocurso`
--
ALTER TABLE `tipocurso`
  ADD PRIMARY KEY (`idTipoCurso`);

--
-- Índices para tabela `tiporegime`
--
ALTER TABLE `tiporegime`
  ADD PRIMARY KEY (`idRegime`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `idCidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de tabela `experiencia`
--
ALTER TABLE `experiencia`
  MODIFY `idExperiencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `formacao`
--
ALTER TABLE `formacao`
  MODIFY `idFormacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcao`
--
ALTER TABLE `funcao`
  MODIFY `idFuncao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `lotacao`
--
ALTER TABLE `lotacao`
  MODIFY `idLotacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `idTelefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipocurso`
--
ALTER TABLE `tipocurso`
  MODIFY `idTipoCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `tiporegime`
--
ALTER TABLE `tiporegime`
  MODIFY `idRegime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `idEstado_id` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`);

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `cidade_id` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`idCidade`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `formacao`
--
ALTER TABLE `formacao`
  ADD CONSTRAINT `tipo_curso_id` FOREIGN KEY (`tipoCurso`) REFERENCES `tipocurso` (`idTipoCurso`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
