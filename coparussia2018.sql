-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Dez-2021 às 15:14
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `coparussia2018`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `arbitro`
--

CREATE TABLE `arbitro` (
  `id_arbitro` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `caveira`
--

CREATE TABLE `caveira` (
  `id_caveira` int(11) NOT NULL,
  `qtd_faltas` int(11) DEFAULT NULL,
  `qtd_gols` int(11) DEFAULT NULL,
  `min_sub` int(11) DEFAULT NULL,
  `qtd_cartoes` int(11) DEFAULT NULL,
  `fk_partida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `caveira`
--

INSERT INTO `caveira` (`id_caveira`, `qtd_faltas`, `qtd_gols`, `min_sub`, `qtd_cartoes`, `fk_partida`) VALUES
(1, 3, 0, 0, NULL, NULL),
(2, 1, 1, 75, NULL, NULL),
(3, 2, 0, 59, NULL, NULL),
(4, 0, 2, 0, NULL, NULL),
(5, 1, 1, 82, 1, NULL),
(6, 5, 0, 89, 1, NULL),
(7, 0, 3, NULL, NULL, NULL),
(8, 2, 3, 88, 1, NULL),
(9, 0, 0, 79, 1, NULL),
(10, 1, 2, 85, 1, NULL),
(11, 0, 1, 0, 0, 2),
(12, 0, 2, 71, 0, 2),
(13, 0, 1, 61, 0, 2),
(14, 0, 1, 0, 0, 2),
(15, 1, 1, 79, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `copa`
--

CREATE TABLE `copa` (
  `id_copa` int(11) NOT NULL,
  `ano` int(11) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `copa`
--

INSERT INTO `copa` (`id_copa`, `ano`, `pais`, `nome`) VALUES
(1, 2021, 'Sul América', 'Eliminatórias sul-americana'),
(2, 2020, 'Brasil', 'Copa América');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE `equipe` (
  `id_equipe` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `fundacao` int(11) NOT NULL,
  `qtd_titulos` int(11) DEFAULT NULL,
  `colocacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`id_equipe`, `nome`, `fundacao`, `qtd_titulos`, `colocacao`) VALUES
(1, 'Brasil', 1914, 20, 1),
(2, 'Argentina', 1893, 20, 2),
(3, 'Equador', 1925, 3, 3),
(4, 'Colômbia', 1924, 1, 4),
(5, 'Peru', 1922, 2, 5),
(6, 'Chile', 1895, 2, 6),
(7, 'Uruguai', 1900, 17, 7),
(8, 'Bolívia', 1925, 1, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE `jogador` (
  `id_jogador` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `nacionalidade` varchar(30) DEFAULT NULL,
  `fk_caveira` int(11) DEFAULT NULL,
  `fk_equipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`id_jogador`, `nome`, `nacionalidade`, `fk_caveira`, `fk_equipe`) VALUES
(1, 'Neymar Jr', 'Brasileiro', 14, 1),
(2, 'Lionel Messi', 'Argentino', 1, 2),
(3, 'Raphinha', 'Brasileiro', 12, 1),
(4, 'Vini Jr', 'Brasileiro', 1, 1),
(5, 'Antony', 'Brasileiro', 1, 1),
(6, 'Ángel Di Maria', 'Argentino', 15, 2),
(7, 'Luis Suarez', 'Uruguaio', 11, 7),
(8, 'Gabigol', 'Brasileira', 13, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `partida`
--

CREATE TABLE `partida` (
  `id_partida` int(11) NOT NULL,
  `data_partida` date NOT NULL,
  `hora_inicio` time DEFAULT NULL,
  `qtd_gols` int(11) DEFAULT NULL,
  `qtd_faltas` int(11) DEFAULT NULL,
  `fk_time_casa` int(11) NOT NULL,
  `fk_time_fora` int(11) NOT NULL,
  `fk_copa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `partida`
--

INSERT INTO `partida` (`id_partida`, `data_partida`, `hora_inicio`, `qtd_gols`, `qtd_faltas`, `fk_time_casa`, `fk_time_fora`, `fk_copa`) VALUES
(1, '2021-07-10', '21:00:00', 1, 41, 1, 2, 2),
(2, '2021-10-14', '21:30:00', 5, NULL, 1, 7, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `arbitro`
--
ALTER TABLE `arbitro`
  ADD PRIMARY KEY (`id_arbitro`);

--
-- Índices para tabela `caveira`
--
ALTER TABLE `caveira`
  ADD PRIMARY KEY (`id_caveira`),
  ADD KEY `fk_partida` (`fk_partida`);

--
-- Índices para tabela `copa`
--
ALTER TABLE `copa`
  ADD PRIMARY KEY (`id_copa`);

--
-- Índices para tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id_equipe`);

--
-- Índices para tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`id_jogador`),
  ADD KEY `fk_caveira` (`fk_caveira`),
  ADD KEY `fk_equipe` (`fk_equipe`);

--
-- Índices para tabela `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id_partida`),
  ADD KEY `partida_ibfk_1` (`fk_time_casa`),
  ADD KEY `partida_ibfk_2` (`fk_time_fora`),
  ADD KEY `fk_copa` (`fk_copa`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arbitro`
--
ALTER TABLE `arbitro`
  MODIFY `id_arbitro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `caveira`
--
ALTER TABLE `caveira`
  MODIFY `id_caveira` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `copa`
--
ALTER TABLE `copa`
  MODIFY `id_copa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `jogador`
--
ALTER TABLE `jogador`
  MODIFY `id_jogador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `partida`
--
ALTER TABLE `partida`
  MODIFY `id_partida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `caveira`
--
ALTER TABLE `caveira`
  ADD CONSTRAINT `caveira_ibfk_1` FOREIGN KEY (`fk_partida`) REFERENCES `partida` (`id_partida`);

--
-- Limitadores para a tabela `jogador`
--
ALTER TABLE `jogador`
  ADD CONSTRAINT `jogador_ibfk_1` FOREIGN KEY (`fk_caveira`) REFERENCES `caveira` (`id_caveira`),
  ADD CONSTRAINT `jogador_ibfk_2` FOREIGN KEY (`fk_equipe`) REFERENCES `equipe` (`id_equipe`);

--
-- Limitadores para a tabela `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`fk_time_casa`) REFERENCES `equipe` (`id_equipe`),
  ADD CONSTRAINT `partida_ibfk_2` FOREIGN KEY (`fk_time_fora`) REFERENCES `equipe` (`id_equipe`),
  ADD CONSTRAINT `partida_ibfk_3` FOREIGN KEY (`fk_copa`) REFERENCES `copa` (`id_copa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
