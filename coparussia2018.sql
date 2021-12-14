-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Dez-2021 às 15:13
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
-- Estrutura da tabela `arbitragem`
--

CREATE TABLE `arbitragem` (
  `nome` varchar(45) NOT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  `pais_de_origem` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `arbitragem`
--

INSERT INTO `arbitragem` (`nome`, `funcao`, `pais_de_origem`) VALUES
('Andrés Cunha', 'Arbitro', 'Uruguai'),
('Mauricio Espinosa', 'Assistente', 'Uruguai'),
('Nicolás Tarán', 'Assistente', 'Uruguai');

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
(8, 'Gabigol', 'Brasileira', 13, 1),
(9, 'Thiago Silva', 'Brasileiro', 14, 1),
(10, 'Marquinhos', 'Brasileiro', 14, 1),
(11, 'Casemiro', 'Brasileiro', 1, 1),
(12, 'Paquetá', 'Brasileiro', 2, 1),
(13, 'Emerson Royal', 'Brasileiro', 9, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_de_jogadores`
--

CREATE TABLE `log_de_jogadores` (
  `id_log` int(11) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `fk_partida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `media_faltas`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `media_faltas` (
`Média de faltas por partida` decimal(11,0)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `media_gols_julho`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `media_gols_julho` (
);

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
(2, '2021-10-14', '21:30:00', 5, 18, 1, 7, 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `total_gols_jogador`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `total_gols_jogador` (
`Nome do jogador` varchar(50)
,`Total de gols` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `total_partidas`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `total_partidas` (
`Total de partidas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `media_faltas`
--
DROP TABLE IF EXISTS `media_faltas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `media_faltas`  AS SELECT round(avg(`p`.`qtd_faltas`),0) AS `Média de faltas por partida` FROM `partida` AS `p` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `media_gols_julho`
--
DROP TABLE IF EXISTS `media_gols_julho`;
-- Erro ao ler a estrutura para a tabela coparussia2018.media_gols_julho: #1267 - Combinação ilegal de collations (utf8mb4_unicode_ci,COERCIBLE) e (utf8mb4_general_ci,COERCIBLE) para operação '='

-- --------------------------------------------------------

--
-- Estrutura para vista `total_gols_jogador`
--
DROP TABLE IF EXISTS `total_gols_jogador`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_gols_jogador`  AS SELECT `j`.`nome` AS `Nome do jogador`, `c`.`qtd_gols` AS `Total de gols` FROM (`jogador` `j` join `caveira` `c`) WHERE `j`.`fk_caveira` = `c`.`id_caveira` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `total_partidas`
--
DROP TABLE IF EXISTS `total_partidas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_partidas`  AS SELECT count(0) AS `Total de partidas` FROM `partida` ;

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
-- Índices para tabela `log_de_jogadores`
--
ALTER TABLE `log_de_jogadores`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `fk_partida` (`fk_partida`);

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
  MODIFY `id_jogador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `log_de_jogadores`
--
ALTER TABLE `log_de_jogadores`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

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
-- Limitadores para a tabela `log_de_jogadores`
--
ALTER TABLE `log_de_jogadores`
  ADD CONSTRAINT `log_de_jogadores_ibfk_1` FOREIGN KEY (`fk_partida`) REFERENCES `partida` (`id_partida`);

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
