-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Nov-2021 às 12:39
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdquazar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_administradores`
--

CREATE TABLE `tb_administradores` (
  `id` int(11) NOT NULL,
  `id_userAdministrador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_administradores`
--

INSERT INTO `tb_administradores` (`id`, `id_userAdministrador`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_anuncioservicos`
--

CREATE TABLE `tb_anuncioservicos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `subcategoria` varchar(200) NOT NULL,
  `descricao` text NOT NULL,
  `imagem` varchar(200) DEFAULT NULL,
  `id_prestador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_anuncioservicos`
--

INSERT INTO `tb_anuncioservicos` (`id`, `titulo`, `categoria`, `subcategoria`, `descricao`, `imagem`, `id_prestador`) VALUES
(25, 'pedreiro azulegista', 'pedreiro', 'Azulegista / Piso', 'teste', '', 17),
(26, 'pedreiro reboque', 'pedreiro', 'Rebocar parede', 'teste', '', 17),
(27, 'pedreiro escadas', 'pedreiro', 'Construir escadas', 'teste', '', 17),
(28, 'pedreiro contrapiso', 'pedreiro', 'Fazer contrapiso', 'teste', '', 17),
(31, 'pintor textura', 'pintor', 'Textura', 'teste', '', 17),
(32, 'pintor papel', 'pintor', 'Papel de parede', 'teste', '', 17),
(33, 'marceneiro reforma', 'marcenaria', 'Reforma', 'teste', '', 17),
(34, 'marcenaria porta 2.0', 'marcenaria', 'Porta de madeira', 'teste', '', 17),
(36, 'encanador', 'encanador', 'Encanador', 'teste', '', 17),
(37, 'eletrodomestico 2.0', 'eletroeletronica', 'Eletrodomestico', 'teste', '', 17),
(38, 'Eletricista instalacao 2.0', 'eletronica', 'Instalacao', 'teste', '', 17),
(39, 'marcenaria montagem', 'marcenaria', 'Montagem', 'teste', '', 17),
(40, 'marcenaria moveis 2.0', 'marcenaria', 'Moveis sobmedida', 'teste', '', 17),
(41, 'pintor classica 2.0', 'pintor', 'Pintura classica', 'teste', '', 17),
(42, 'pintor grafite 2.0', 'pintor', 'Grafite', 'teste', '', 17),
(44, 'Eletricista reparo teste', 'eletricista', 'Reparo', 'teste', '', 17),
(45, 'Arrumar Geladeira', 'eletroeletronica', 'Eletrodomestico', 'arrumo geladeiras electrolux', '', 8),
(47, 'Marcenaria 4.0', 'marcenaria', 'Moveis sobmedida', 'Moveis planejados com 20% de desconto na black friday', '', 12),
(48, 'Arrumar Geladeira', 'eletroeletronica', 'Eletrodomestico', 'teste', 'geladeira', 12),
(49, 'Arruma PC', 'eletroeletronica', 'Eletrodomestico', 'teste 501', 'pc', 12),
(50, 'arrumo porta de guarda-roupa', 'marcenaria', 'Porta de madeira', 'sla', 'portaMadeira', 31),
(51, 'teste 69', 'pintor', 'Pintura classica', 'lsks', 'pintura', 31),
(52, 'sla man', 'eletricista', 'Reparo', 'sla man 2', 'plano.jpg', 33);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_clientes`
--

CREATE TABLE `tb_clientes` (
  `id` int(11) NOT NULL,
  `id_userCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_clientes`
--

INSERT INTO `tb_clientes` (`id`, `id_userCliente`) VALUES
(22, 35),
(25, 40),
(31, 68),
(32, 71),
(34, 76),
(35, 77),
(36, 80);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_imagens`
--

CREATE TABLE `tb_imagens` (
  `id` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_imagens`
--

INSERT INTO `tb_imagens` (`id`, `foto`) VALUES
(5, 'ping1'),
(6, 'samarapinguim'),
(7, 'tropa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pedidos`
--

CREATE TABLE `tb_pedidos` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` int(11) NOT NULL,
  `bairro` varchar(200) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `imagem` varchar(200) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_prestador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_pedidos`
--

INSERT INTO `tb_pedidos` (`id`, `nome`, `email`, `telefone`, `bairro`, `descricao`, `imagem`, `id_cliente`, `id_prestador`) VALUES
(28, 'Jim Lake Jr', 'jimbo@troll.com', 69824561, 'Guaianazes', 'desejo arrumar minha geladeira', '', 22, 8),
(29, 'Jim Lake Jr', 'jimbo@troll.com', 69824561, 'Guaianazes', 'Boa noite\r\nDesejo um reparo em meu celular', '', 22, 12),
(31, 'Jonas', 'jonas@gmail.com', 69824561, 'Guaianazes', 'Moveis de cozinha planejado', '', 25, 12),
(32, 'Jonas', 'jonas@gmail.com', 69824561, 'Guaianazes', 'Teste sla', '', 25, 12),
(33, 'Fabio', 'fabio@gmail.com', 54784512, 'Vila Roseira II', 'Teste de imagem fds', 'download (1).png', 36, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_prestadoresservico`
--

CREATE TABLE `tb_prestadoresservico` (
  `id` int(11) NOT NULL,
  `id_userPrestador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_prestadoresservico`
--

INSERT INTO `tb_prestadoresservico` (`id`, `id_userPrestador`) VALUES
(8, 39),
(9, 41),
(10, 43),
(11, 44),
(12, 45),
(17, 50),
(27, 60),
(29, 63),
(30, 64),
(31, 72),
(32, 74),
(33, 79);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servicos`
--

CREATE TABLE `tb_servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_servicos`
--

INSERT INTO `tb_servicos` (`id`, `nome`, `descricao`) VALUES
(1, 'marceneiro', 'moveis planejados'),
(2, 'eletricista', 'parte eletrica da casa'),
(3, 'eletrodomesticos', 'arruma os eletrodomesticos da casa'),
(4, 'pedreiro', 'constroi casas, paredes, etc'),
(5, 'pintor', 'serviço de pintura'),
(6, 'encanador', 'trabalho com encanamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servicosprestador`
--

CREATE TABLE `tb_servicosprestador` (
  `id` int(11) NOT NULL,
  `id_servico` int(11) DEFAULT NULL,
  `id_prestador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_servicosprestador`
--

INSERT INTO `tb_servicosprestador` (`id`, `id_servico`, `id_prestador`) VALUES
(30, 1, 27),
(31, 2, 27),
(32, 3, 27),
(38, 1, 29),
(41, 1, 17),
(42, 1, 8),
(43, 3, 17),
(44, 4, 8),
(45, 3, 30),
(46, 2, 31),
(47, 3, 31),
(48, 1, 32),
(49, 2, 32),
(50, 1, 33),
(51, 6, 33);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_telefones`
--

CREATE TABLE `tb_telefones` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_telefones`
--

INSERT INTO `tb_telefones` (`id`, `numero`, `id_user`) VALUES
(18, 69824561, 35),
(22, 61797599, 39),
(23, 69824561, 40),
(24, 85661234, 41),
(26, 45223658, 43),
(27, 85661234, 44),
(28, 61797599, 45),
(33, 61797599, 50),
(43, 25413698, 60),
(46, 61797599, 63),
(47, 61797599, 64),
(51, 40028922, 68),
(54, 61797599, 71),
(55, 61797599, 72),
(56, 4242424, 74),
(58, 424452, 76),
(59, 45544554, 77),
(60, 245245254, 79),
(61, 54784512, 80);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipousers`
--

CREATE TABLE `tb_tipousers` (
  `id` int(11) NOT NULL,
  `tipoUser` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_tipousers`
--

INSERT INTO `tb_tipousers` (`id`, `tipoUser`) VALUES
(1, 'cliente'),
(2, 'prestador'),
(3, 'administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `cpf` varchar(250) NOT NULL,
  `idade` int(11) NOT NULL,
  `cep` varchar(250) NOT NULL,
  `rua` varchar(250) NOT NULL,
  `numeroCasa` int(11) NOT NULL,
  `bairro` varchar(250) NOT NULL,
  `cidade` varchar(200) NOT NULL,
  `imagem` varchar(200) DEFAULT NULL,
  `id_tipoUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_users`
--

INSERT INTO `tb_users` (`id`, `nome`, `email`, `senha`, `cpf`, `idade`, `cep`, `rua`, `numeroCasa`, `bairro`, `cidade`, `imagem`, `id_tipoUser`) VALUES
(1, 'Nickolas', 'nickolas@gmail.com', '1234', '00000000', 0, '000000', 'nenhuma', 0, 'nenhum', '', '', 3),
(2, 'Hitalo', 'hitalo@gmail.com', '1234', '00000000', 0, '000000', 'nenhuma', 0, 'nenhum', '', '', 3),
(3, 'Bruno', 'bruno@gmail.com', '1234', '00000000', 0, '000000', 'nenhum', 0, 'nenhum', '', '', 3),
(4, 'Lucas', 'lucas@gmail.com', '1234', '00000000', 0, '000000', 'nenhum', 0, 'nenhum', '', '', 3),
(5, 'Rikellme', 'rikellme@gmail.com', '1234', '00000000', 0, '000000', 'nenhum', 0, 'nenhum', '', '', 3),
(6, 'Danilo', 'danilo@gmail.com', '1234', '00000000', 0, '000000', 'nenhum', 0, 'nenhum', '', '', 3),
(7, 'Pedro', 'pedro@gmail.com', '1234', '00000000', 0, '000000', 'nenhum', 0, 'nenhum', '', '', 3),
(35, 'Jim Lake Jr', 'jimbo@troll.com', '1234', '32165498701', 18, '08460060', 'Ilha de Amboino', 10, 'Guaianazes', '', '', 1),
(39, 'Kirito', 'kirito@hotmail.com', '1234', '00147258369', 17, '45863014', 'Carlos Santiago', 10, 'Guaianazes', '', '', 2),
(40, 'Jonas', 'jonas@gmail.com', '1234', '12345678910', 15, '03214568', 'Correia Ribeiro', 52, 'Guaianazes', '', '', 1),
(41, 'Seiya de Pegasus', 'pegasus@gmail.com', '1234', '65412378910', 36, '08460214', 'Carlos Santiago', 10, 'Guaianazes', '', '', 2),
(43, 'Sasuke Uchiha', 'sasuchiha@ig.com', '1234', '02583491677', 16, '14785365', 'Torre de Santiago', 2145, 'Morumbi', '', '', 2),
(44, 'Sarah ', 'sarah@hotmail.com', '1234', '78945612335', 22, '08460214', 'Jose Alencar', 77, 'Guaianazes', '', '', 2),
(45, 'Rebeca', 'rebeca@gmail.com', '1234', '40028922356', 15, '03214568', 'Torre de Santiago', 1524, 'Guaianazes', '', '1593805714438-cXT9DrRONt.png', 2),
(50, 'Felipe', 'felipe@hotmail.com', '1234', '69853214710', 35, '08460214', 'Torre de Santiago', 1524, 'Guaianazes', '', '', 2),
(60, 'Roma', 'roma@gmail.com', '1234', '456987125365', 24, '74125369', 'Torre de Santiago', 85, 'Guaianazes', '', '', 2),
(63, 'Thales', 'thales@gmail.com', '1234', '42156253985', 35, '03214568', 'kimioto kamatachi', 52, 'Guaianazes', '', '', 2),
(64, 'Rogerio Ceni', 'rogerinho@gmail.com', '1234', '85796982546', 35, '08460060', 'Rua Ilha de Amboino', 25, 'Jardim Soares', 'SÃ£o Paulo', '', 2),
(68, 'Wallison', 'wallison@gmail.com', '1234', '32145412478', 18, '08460060', 'Rua Ilha de Amboino', 1524, 'Jardim Soares', 'SÃ£o Paulo', 'perfilWallison', 1),
(71, 'Andrew', 'andrew@gmail.com', '1234', '54654685412', 35, '08460060', 'Rua Ilha de Amboino', 52, 'Jardim Soares', 'SÃ£o Paulo', 'perfilAndrew', 1),
(72, 'ItÃ¡lia', 'italia@gmail.com', '1234', '12365874874', 35, '08460060', 'Rua Ilha de Amboino', 52, 'Jardim Soares', 'SÃ£o Paulo', 'perfilItalia', 2),
(74, 'Angelo', 'angelo@gmail.com', '1234', '54445424242', 45, '08466050', 'Rua Arco Ãris', 118, 'Vila Roseira II', 'SÃ£o Paulo', NULL, 2),
(76, 'Angela', 'angela@gmail.com', '1234', '45424524524', 5, '08466050', 'Rua Arco Ãris', 123, 'Vila Roseira II', 'SÃ£o Paulo', 'download (1).png', 1),
(77, 'joana', 'joana@gmail.com', '1234', '5445427788', 5, '08466050', 'Rua Arco Ãris', 21, 'Vila Roseira II', 'SÃ£o Paulo', '1593805714438-cXT9DrRONt.png', 1),
(79, 'logan', 'logan@gmail.com', '1234', '24272452524', 45, '08466050', 'Rua Arco Ãris', 12, 'Vila Roseira II', 'SÃ£o Paulo', 'plano.jpg', 2),
(80, 'Fabio', 'fabio@gmail.com', '1234', '74587456214', 45, '08466050', 'Rua Arco Ãris', 54, 'Vila Roseira II', 'SÃ£o Paulo', '1593805714438-cXT9DrRONt.png', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_administradores`
--
ALTER TABLE `tb_administradores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_userAdministrador` (`id_userAdministrador`);

--
-- Índices para tabela `tb_anuncioservicos`
--
ALTER TABLE `tb_anuncioservicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prestador` (`id_prestador`);

--
-- Índices para tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_userCliente` (`id_userCliente`);

--
-- Índices para tabela `tb_imagens`
--
ALTER TABLE `tb_imagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_prestador` (`id_prestador`);

--
-- Índices para tabela `tb_prestadoresservico`
--
ALTER TABLE `tb_prestadoresservico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_userPrestador` (`id_userPrestador`);

--
-- Índices para tabela `tb_servicos`
--
ALTER TABLE `tb_servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_servicosprestador`
--
ALTER TABLE `tb_servicosprestador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_servico` (`id_servico`),
  ADD KEY `id_prestador` (`id_prestador`);

--
-- Índices para tabela `tb_telefones`
--
ALTER TABLE `tb_telefones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Índices para tabela `tb_tipousers`
--
ALTER TABLE `tb_tipousers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipoUser` (`id_tipoUser`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_administradores`
--
ALTER TABLE `tb_administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_anuncioservicos`
--
ALTER TABLE `tb_anuncioservicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `tb_imagens`
--
ALTER TABLE `tb_imagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `tb_prestadoresservico`
--
ALTER TABLE `tb_prestadoresservico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `tb_servicos`
--
ALTER TABLE `tb_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_servicosprestador`
--
ALTER TABLE `tb_servicosprestador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `tb_telefones`
--
ALTER TABLE `tb_telefones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `tb_tipousers`
--
ALTER TABLE `tb_tipousers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_administradores`
--
ALTER TABLE `tb_administradores`
  ADD CONSTRAINT `tb_administradores_ibfk_1` FOREIGN KEY (`id_userAdministrador`) REFERENCES `tb_users` (`id`);

--
-- Limitadores para a tabela `tb_anuncioservicos`
--
ALTER TABLE `tb_anuncioservicos`
  ADD CONSTRAINT `tb_anuncioservicos_ibfk_1` FOREIGN KEY (`id_prestador`) REFERENCES `tb_prestadoresservico` (`id`);

--
-- Limitadores para a tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD CONSTRAINT `tb_clientes_ibfk_1` FOREIGN KEY (`id_userCliente`) REFERENCES `tb_users` (`id`);

--
-- Limitadores para a tabela `tb_pedidos`
--
ALTER TABLE `tb_pedidos`
  ADD CONSTRAINT `tb_pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id`),
  ADD CONSTRAINT `tb_pedidos_ibfk_2` FOREIGN KEY (`id_prestador`) REFERENCES `tb_prestadoresservico` (`id`);

--
-- Limitadores para a tabela `tb_prestadoresservico`
--
ALTER TABLE `tb_prestadoresservico`
  ADD CONSTRAINT `tb_prestadoresservico_ibfk_1` FOREIGN KEY (`id_userPrestador`) REFERENCES `tb_users` (`id`);

--
-- Limitadores para a tabela `tb_servicosprestador`
--
ALTER TABLE `tb_servicosprestador`
  ADD CONSTRAINT `tb_servicosprestador_ibfk_1` FOREIGN KEY (`id_servico`) REFERENCES `tb_servicos` (`id`),
  ADD CONSTRAINT `tb_servicosprestador_ibfk_2` FOREIGN KEY (`id_prestador`) REFERENCES `tb_prestadoresservico` (`id`);

--
-- Limitadores para a tabela `tb_telefones`
--
ALTER TABLE `tb_telefones`
  ADD CONSTRAINT `tb_telefones_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`);

--
-- Limitadores para a tabela `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `tb_users_ibfk_1` FOREIGN KEY (`id_tipoUser`) REFERENCES `tb_tipousers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
