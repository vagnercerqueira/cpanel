
CREATE TABLE `base_projeto_acesso_grupo` (
  `id` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_aplicacao` int(11) NOT NULL,
  `perm_cadastrar` char(1) DEFAULT 'S',
  `perm_alterar` char(1) DEFAULT 'S',
  `perm_excluir` char(1) DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `base_projeto_acesso_usuario`
--

CREATE TABLE `base_projeto_acesso_usuario` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_aplicacao` int(11) NOT NULL,
  `perm_cadastrar` char(1) DEFAULT 'S',
  `perm_alterar` char(1) DEFAULT 'S',
  `perm_excluir` char(1) DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `base_projeto_aplicacoes`
--

CREATE TABLE `base_projeto_aplicacoes` (
  `id` int(11) NOT NULL,
  `id_pai` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `icone` varchar(50) DEFAULT NULL,
  `caminho` varchar(50) NOT NULL,
  `ordem` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `base_projeto_aplicacoes`
--

INSERT INTO `base_projeto_aplicacoes` (`id`, `id_pai`, `nome`, `icone`, `caminho`, `ordem`) VALUES
(1, NULL, 'usuarios', 'fas fa-users', '>', '99'),
(2, 1, 'Grupo', NULL, 'usu/Usu004.php', '2'),
(3, 1, 'Cadastro de usuarios', NULL, 'usu/Usu001.php', '1'),
(4, 1, 'aplicacoes', '', 'usu/Usu002.php', '4'),
(5, 1, 'Parametro geral', NULL, 'usu/Usu005.php', '5'),
(6, 1, 'Acessos', NULL, 'usu/Usu003.php', NULL),
(7, 1, 'Acesso por usuario', NULL, 'Usu/Usu006.php', '3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `base_projeto_auditar_log`
--

CREATE TABLE `base_projeto_auditar_log` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `http_user_agent` varchar(200) NOT NULL,
  `id_aplicacao` int(11) DEFAULT NULL,
  `aplicacao` varchar(50) NOT NULL,
  `tb` varchar(50) NOT NULL,
  `acao` varchar(15) NOT NULL,
  `dt_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `dados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `base_projeto_grupo_usuario` (
  `id` int(11) NOT NULL,
  `descricao` varchar(20) NOT NULL,
  `home` varchar(50) DEFAULT 'home_default',
  `superusuario` char(1) DEFAULT 'N',
  `formsearch` char(1) DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `base_projeto_grupo_usuario`
--

INSERT INTO `base_projeto_grupo_usuario` (`id`, `descricao`, `home`, `superusuario`, `formsearch`) VALUES
(1, 'Super usuario', 'home_superusuario', 'S', 'S'),
(2, 'admin', 'home_default', 'N', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `base_projeto_parametro_sistema`
--

CREATE TABLE `base_projeto_parametro_sistema` (
  `id` int(11) NOT NULL,
  `email_suporte` varchar(100) NOT NULL,
  `envia_email_usuario` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `base_projeto_parametro_sistema`
--

INSERT INTO `base_projeto_parametro_sistema` (`id`, `email_suporte`, `envia_email_usuario`) VALUES
(1, 'suporte@arkivar.net', 'N');

-- --------------------------------------------------------

--
-- Estrutura da tabela `base_projeto_senha_email`
--

CREATE TABLE `base_projeto_senha_email` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario` int(11) NOT NULL,
  `senha_temp` varchar(100) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `base_projeto_usuarios`
--

CREATE TABLE `base_projeto_usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `grupo` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT 'A=ATIVO, I=INATIVO, D=DESLIGADO,C=AGUARDANDO CONFIRMACAO',
  `email` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `base_projeto_usuarios`
--

INSERT INTO `base_projeto_usuarios` (`id`, `nome`, `grupo`, `status`, `email`, `usuario`, `senha`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'suporte', 1, 'A', 'vagner.cerqueira@live.com', 'suporte', '$2y$10$46UoLJSkPLMM3nB30C4lFOnS8SobxFN7vT97Hu7S/YmA3e.zcpuiG', 'suporte.jpg', '2020-08-11 14:15:28', '2020-10-02');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `base_projeto_acesso_grupo`
--
ALTER TABLE `base_projeto_acesso_grupo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_grupo_2` (`id_grupo`,`id_aplicacao`),
  ADD KEY `id_grupo` (`id_grupo`),
  ADD KEY `id_aplicacao` (`id_aplicacao`);

--
-- Índices para tabela `base_projeto_acesso_usuario`
--
ALTER TABLE `base_projeto_acesso_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`,`id_aplicacao`),
  ADD KEY `id_aplicacao` (`id_aplicacao`);

--
-- Índices para tabela `base_projeto_aplicacoes`
--
ALTER TABLE `base_projeto_aplicacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pai` (`id_pai`);

--
-- Índices para tabela `base_projeto_auditar_log`
--
ALTER TABLE `base_projeto_auditar_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Índices para tabela `base_projeto_grupo_usuario`
--
ALTER TABLE `base_projeto_grupo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `base_projeto_parametro_sistema`
--
ALTER TABLE `base_projeto_parametro_sistema`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `base_projeto_senha_email`
--
ALTER TABLE `base_projeto_senha_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_projeto_senha_email_ibfk_1` (`usuario`);

--
-- Índices para tabela `base_projeto_usuarios`
--
ALTER TABLE `base_projeto_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `grupo` (`grupo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `base_projeto_acesso_grupo`
--
ALTER TABLE `base_projeto_acesso_grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `base_projeto_acesso_usuario`
--
ALTER TABLE `base_projeto_acesso_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `base_projeto_aplicacoes`
--
ALTER TABLE `base_projeto_aplicacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `base_projeto_auditar_log`
--
ALTER TABLE `base_projeto_auditar_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `base_projeto_grupo_usuario`
--
ALTER TABLE `base_projeto_grupo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `base_projeto_parametro_sistema`
--
ALTER TABLE `base_projeto_parametro_sistema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `base_projeto_senha_email`
--
ALTER TABLE `base_projeto_senha_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `base_projeto_usuarios`
--
ALTER TABLE `base_projeto_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `base_projeto_acesso_grupo`
--
ALTER TABLE `base_projeto_acesso_grupo`
  ADD CONSTRAINT `base_projeto_acesso_grupo_ibfk_1` FOREIGN KEY (`id_aplicacao`) REFERENCES `base_projeto_aplicacoes` (`id`),
  ADD CONSTRAINT `base_projeto_acesso_grupo_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `base_projeto_grupo_usuario` (`id`);

--
-- Limitadores para a tabela `base_projeto_acesso_usuario`
--
ALTER TABLE `base_projeto_acesso_usuario`
  ADD CONSTRAINT `base_projeto_acesso_usuario_ibfk_1` FOREIGN KEY (`id_aplicacao`) REFERENCES `base_projeto_aplicacoes` (`id`),
  ADD CONSTRAINT `base_projeto_acesso_usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `base_projeto_usuarios` (`id`);

--
-- Limitadores para a tabela `base_projeto_auditar_log`
--
ALTER TABLE `base_projeto_auditar_log`
  ADD CONSTRAINT `base_projeto_auditar_log_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `base_projeto_usuarios` (`id`);

--
-- Limitadores para a tabela `base_projeto_senha_email`
--
ALTER TABLE `base_projeto_senha_email`
  ADD CONSTRAINT `base_projeto_senha_email_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `base_projeto_usuarios` (`id`);

--
-- Limitadores para a tabela `base_projeto_usuarios`
--
ALTER TABLE `base_projeto_usuarios`
  ADD CONSTRAINT `base_projeto_usuarios_ibfk_1` FOREIGN KEY (`grupo`) REFERENCES `base_projeto_grupo_usuario` (`id`);
COMMIT;