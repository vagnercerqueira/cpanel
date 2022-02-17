
CREATE TABLE acesso_grupo (
  id int(11) NOT NULL,
  id_grupo int(11) NOT NULL,
  id_aplicacao int(11) NOT NULL,
  perm_cadastrar char(1) DEFAULT 'S',
  perm_alterar char(1) DEFAULT 'S',
  perm_excluir char(1) DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `acesso_grupo` (`id`, `id_grupo`, `id_aplicacao`, `perm_cadastrar`, `perm_alterar`, `perm_excluir`) VALUES
(1, 4, 3, 'S', 'S', 'S'),
(2, 4, 17, 'S', 'S', 'S'),
(3, 4, 19, 'S', 'S', 'S'),
(4, 4, 20, 'S', 'S', 'S'),
(5, 4, 22, 'S', 'S', 'S'),
(6, 4, 23, 'S', 'S', 'S'),
(7, 4, 24, 'S', 'S', 'S'),
(8, 4, 25, 'S', 'S', 'S'),
(9, 4, 29, 'S', 'S', 'S'),
(10, 4, 30, 'S', 'S', 'S'),
(11, 4, 31, 'S', 'S', 'S'),
(12, 4, 32, 'S', 'S', 'S'),
(13, 4, 33, 'S', 'S', 'S'),
(14, 4, 34, 'S', 'S', 'S'),
(15, 4, 36, 'S', 'S', 'S'),
(16, 4, 28, 'S', 'S', 'S'),
(17, 4, 44, 'S', 'S', 'S'),
(18, 4, 43, 'S', 'S', 'S'),
(19, 4, 47, 'S', 'S', 'S'),
(20, 4, 48, 'S', 'S', 'S'),
(21, 4, 49, 'S', 'S', 'S'),
(22, 4, 53, 'S', 'S', 'S'),
(23, 4, 51, 'S', 'S', 'S'),
(24, 4, 55, 'S', 'S', 'S'),
(25, 4, 39, 'S', 'S', 'S'),
(26, 4, 40, 'S', 'S', 'S'),
(27, 4, 42, 'S', 'S', 'S'),
(28, 4, 60, 'S', 'S', 'S'),
(29, 7, 62, 'S', 'S', 'S');

CREATE TABLE acesso_usuario (
  id int(11) NOT NULL,
  id_usuario int(11) NOT NULL,
  id_aplicacao int(11) NOT NULL,
  perm_cadastrar char(1) DEFAULT 'S',
  perm_alterar char(1) DEFAULT 'S',
  perm_excluir char(1) DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE aplicacoes (
  id int(11) NOT NULL,
  id_pai int(11) DEFAULT NULL,
  nome varchar(50) NOT NULL,
  icone varchar(50) DEFAULT NULL,
  caminho varchar(50) NOT NULL,
  ordem decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO aplicacoes (id, id_pai, nome, icone, caminho, ordem) VALUES
(1, NULL, 'Usuarios', 'fas fa-users', '>', 99),
(2, 18, 'Grupo', NULL, 'Usu/Usu004.php', 2),
(3, 1, 'Cadastro de Usuarios', NULL, 'usu/Usu001.php', 1),
(4, 18, 'Aplicacoes', NULL, 'Usu/Usu002.php', 4),
(5, 18, 'Parametro geral', NULL, 'Usu/Usu005.php', 5),
(6, 18, 'Acessos', NULL, 'Usu/Usu003.php', NULL),
(7, 1, 'Acesso por usuario', NULL, 'Usu/Usu006.php', 3),
(17, 18, 'Tipo contratação', NULL, 'Usu/Usu008.php', NULL),
(18, 1, 'Cadastros Basicos', NULL, '>', 3),
(19, 18, 'Equipe', NULL, 'Usu/Usu007.php', NULL),
(20, 26, 'Status de ativacoes', NULL, 'Ven/Ven001.php', 21),
(21, NULL, 'Vendas', NULL, '>', 1),
(22, 26, 'Turno instalação', NULL, 'Ven/Ven002.php', 21),
(23, 26, 'Cadastro Faturamento', NULL, 'Ven/Ven003.php', 6),
(24, 26, 'Cadastro Fibra', NULL, 'Ven/Ven004.php', 4),
(25, 26, 'Cadastro TV', NULL, 'Ven/Ven005.php', 5),
(26, 21, 'Cadastros basicos', NULL, '>', 3),
(27, 21, 'Vendas', NULL, 'Ven/Ven006.php', NULL),
(28, 21, 'Atualizações base', NULL, 'Ven/Ven007.php', 2),
(29, 26, 'Forma pagamento', NULL, 'Ven/Ven008.php', 20),
(30, 26, 'Dias de vencimento', NULL, 'Ven/Ven009.php', 19),
(31, 26, 'Cadastro bancos', NULL, 'Ven/Ven010.php', 2),
(32, 26, 'Combo Plano', NULL, 'Ven/Ven011.php', 11),
(33, 26, 'Setor tratamento', NULL, 'Ven/Ven012.php', 13),
(34, 26, 'UF Atuação', NULL, 'Ven/Ven013.php', 18),
(35, 37, 'DVF x CSV', NULL, 'Ven/Ven015.php', 15),
(36, 26, 'Mensagem Whatsapp', NULL, 'Ven/Ven014.php', 17),
(37, 26, 'Parametros Uplods', NULL, '>', 1),
(38, 37, 'BOV x CSV', NULL, 'Ven/Ven016.php', 2),
(39, 56, 'Linhas Pgto', NULL, 'Ven/Ven017.php', 1),
(40, 58, 'LINHA PGTO x CSV', NULL, 'Ven/Ven018.php', NULL),
(41, 37, 'Venda Lote', NULL, 'Ven/Ven019.php', NULL),
(42, 57, 'Mailling', NULL, 'Ven/Ven020.php', NULL),
(43, 46, 'Peso dias', NULL, 'Ven/Ven021.php', 2),
(44, 21, 'Envio de emails', NULL, 'Ven/Ven022.php', NULL),
(45, NULL, 'Metas', NULL, '>', 1),
(46, 45, 'Cadastro basicos', NULL, '>', 4),
(47, 46, 'Tipos de meta', NULL, 'Met/Met001.php', 4),
(48, 45, 'Meta supervisor', NULL, 'Met/Met002.php', 2),
(49, 45, 'Meta vendedor', NULL, 'Met/Met003.php', 1),
(50, NULL, 'Producao', NULL, '>', 3),
(51, 54, 'Producao vendedor', NULL, 'Prod/Prod001.php', NULL),
(52, 50, 'Supervisor', NULL, '>', NULL),
(53, 52, 'Supervisor - Mensal', NULL, 'Prod/Prod002.php', NULL),
(54, 50, 'Vendedor', NULL, '>', NULL),
(55, 54, 'Vendedor - Mensal', NULL, 'Prod/Prod003.php', NULL),
(56, NULL, 'Financeiro', NULL, '>', 4),
(57, NULL, 'Mailing', NULL, '>', 5),
(58, 56, 'Cadastro basicos', NULL, '>', 2),
(59, NULL, 'Dashboard', NULL, '>', 25),
(60, 61, 'Vendas x Instaladas', NULL, 'Graf/Graf001.php', NULL),
(61, 59, 'Produção', NULL, '>', NULL),
(62, 21, 'Consulta DFV', NULL, 'Ven/Ven023.php', 23),
(63, 26, 'Parametros CSV', NULL, 'Ven/Ven024.php', NULL),
(64, 21, 'Vendas Supervisor', NULL, 'Ven/Ven025.php', NULL),
(65, 57, 'Mailing(s)', NULL, 'Ven/Ven026.php', 2),
(66, 21, 'POS - INSTALACAO', NULL, 'Ven/Ven028.php', NULL);



CREATE TABLE auditar_log (
  id int(11) NOT NULL,
  id_user int(11) NOT NULL,
  http_user_agent varchar(200) NOT NULL,
  id_aplicacao int(11) DEFAULT NULL,
  aplicacao varchar(50) NOT NULL,
  tb varchar(50) NOT NULL,
  acao varchar(15) NOT NULL,
  dt_cadastro datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dados longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  ip varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE bancos_permitidos (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO bancos_permitidos (id, descricao) VALUES
(6, 'Caixa Economica Federal'),
(7, 'Itau'),
(8, 'Bradesco'),
(9, 'Santander'),
(10, 'Banco do Brasil');


CREATE TABLE combo_planos (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO combo_planos (id, descricao) VALUES
(4, 'Oi Total Play'),
(5, 'Oi Fibra'),
(6, 'Oi Total Residencial');



CREATE TABLE dias_vencimento (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO dias_vencimento (id, descricao) VALUES
(6, '11'),
(7, '2'),
(8, '7'),
(9, '16');



CREATE TABLE equipe_usuario (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL,
  supervisor int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE forma_pagamento (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO forma_pagamento (id, descricao) VALUES
(4, 'Debito em conta'),
(5, 'Boleto'),
(6, 'Credito');



CREATE TABLE grupo_envio_emails (
  id int(11) NOT NULL,
  id_grupo int(11) NOT NULL,
  bov_csv char(1) DEFAULT 'N',
  dfv_csv char(1) DEFAULT 'N',
  blindagem_csv char(1) DEFAULT 'N',
  linha_pgto_csv char(1) DEFAULT 'N',
  venda_lote_csv char(1) DEFAULT 'N',
  mailing_csv char(1) DEFAULT 'N',  
  vendas_dia_seguinte CHAR(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `grupo_envio_emails` (`id`, `id_grupo`, `bov_csv`, `dfv_csv`, `blindagem_csv`, `linha_pgto_csv`, `venda_lote_csv`, `mailing_csv`, `vendas_dia_seguinte`) VALUES
(1, 4, 'S', 'N', 'N', 'S', 'S', 'N', 'S'),
(2, 7, 'S', 'S', 'N', 'N', NULL, 'N', NULL),
(3, 5, 'S', 'S', 'S', 'N', 'S', 'N', NULL),
(4, 8, 'S', 'S', 'S', 'N', 'S', 'N', NULL),
(5, 6, 'S', 'S', 'S', 'N', 'S', 'N', NULL),
(6, 9, 'S', 'S', 'S', 'N', 'S', 'S', NULL);

CREATE TABLE grupo_usuario (
  id int(11) NOT NULL,
  descricao varchar(20) NOT NULL,
  home varchar(50) DEFAULT 'home_default',
  superusuario char(1) DEFAULT 'N',
  formsearch char(1) DEFAULT 'S',
  cod_interno decimal(6,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO grupo_usuario (id, descricao, home, superusuario, formsearch, cod_interno) VALUES
(1, 'Super usuario', 'home_superusuario', 'S', 'S', 9999),
(4, 'Diretor', 'home_diretor', 'N', 'S', 1000),
(5, 'Supervisor de Vendas', 'home_default', 'N', 'S', 970),
(6, 'Backoffice', 'home_supervisor_bko', 'N', 'S', 980),
(7, 'Vendedor', 'home_default', 'N', 'S', 960),
(8, 'Supervisor BKO', 'home_supervisor_bko', 'N', 'S', 990);

CREATE TABLE linha_pgto (
  id int(11) NOT NULL,
  num_os varchar(15) NOT NULL,
  cod_sap decimal(10,0) NOT NULL,
  valor decimal(7,2) NOT NULL,
  data_instalacao date NOT NULL,
  filial char(2) DEFAULT NULL,
  ciclo decimal(10,0) DEFAULT NULL,
  quinzena varchar(10) NOT NULL,
  cpf_cliente varchar(14) DEFAULT NULL,
  dt_insert datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_usu_insert int(11) NOT NULL,
  status char(1) NOT NULL DEFAULT 'A' COMMENT 'A=ATIVO, I=INATIVO',
  dt_delete datetime DEFAULT NULL,
  id_usu_delete int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE mailing_clientes (
  cpf decimal(14,0) NOT NULL COMMENT 'pode ser cpf ou cnpj',
  nome varchar(100) NOT NULL,
  email varchar(100) DEFAULT NULL,
  contato1 varchar(30) DEFAULT NULL,
  contato2 varchar(30) DEFAULT NULL,
  contato3 varchar(30) DEFAULT NULL,
  contato4 varchar(30) DEFAULT NULL,
  cep int(10) NOT NULL,
  uf char(2) DEFAULT NULL,
  cidade varchar(100) DEFAULT NULL,
  bairro varchar(100) DEFAULT NULL,
  logradouro varchar(100) DEFAULT NULL,
  num_fachada decimal(15,0) DEFAULT NULL,
  nome_mailing varchar(50) NOT NULL,
  data_mailing datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE mensagem_whatsapp (
  id int(11) NOT NULL,
  zap_agendamento1 varchar(500) DEFAULT NULL,
  zap_reagendamento_1 varchar(500) DEFAULT NULL,
  zap_reagendamento_2 varchar(500) DEFAULT NULL,
  zap_reagendamento_3 varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO mensagem_whatsapp (id, zap_agendamento1, zap_reagendamento_1, zap_reagendamento_2, zap_reagendamento_3) VALUES
(1, 'Oi <NOME_CLIENTE_CSV>, tudo bem ? o agendamento da sua Fibra esta para o dia <DT_AGENDAMENTO> período<TURNO_AGENDAMENTO>, fique atento. ', 'Oi <NOME_CLIENTE_CSV>, infelizmente houve um imprevisto e sua instalação foi remarcada para <DT_REAGENDAMENTO> e turno <TURNO_REAGENDAMENTO>', 'reagendamento2', 'reagendamento3');

CREATE TABLE metas (
  id int(11) NOT NULL,
  competencia date NOT NULL,
  tipo int(11) NOT NULL,
  equipe int(11) NOT NULL,
  venda decimal(7,2) NOT NULL,
  instalacao decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE meta_vendedor (
  id int(11) NOT NULL,
  competencia date NOT NULL,
  tipo int(11) NOT NULL,
  equipe int(11) NOT NULL,
  venda decimal(7,2) NOT NULL,
  instalacao decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE parametros_uploads_csv (
  id int(11) NOT NULL,
  venda_lote text NOT NULL,
  bov text NOT NULL,
  mailing text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO parametros_uploads_csv (id, venda_lote, bov, mailing) VALUES
(1, '{\"ORGAO_EXPEDIDOR_CSV\":\"ÓRGÃO EXPEDIDOR\",\"NOME_CLIENTE_CSV\":\"NOME CLIENTE\",\"GENERO_CSV\":\"GÊNERO\",\"DT_NASCIMENTO_CSV\":\"DATA DE NASCIMENTO\",\"PLANO_TV_CSV\":\"TV - PLANO TV\",\"CPF_CNPJ_CSV\":\"CPF\",\"DT_VENDA_CSV\":\"DATA PEDIDO FOI REALIZADO\",\"NOME_MAE_CSV\":\"NOME COMPLETO DA MÃE\",\"CONTATO_PRINCIPAL_CSV\":\"CONTATO PRINCIPAL\",\"CONTATO_SECUNDARIO_CSV\":\"CONTATO SECUNDÁRIO\",\"EMAIL_CSV\":\"E-MAIL\",\"MATRICULA_VENDEDOR_CSV\":\"MATRICULA VENDEDOR\",\"BANDA_LARGA_VELOCIDADE_CSV\":\"BANDA LARGA - VELOCIDADE\",\"COMBO_CONTRATADO_CSV\":\"COMBO/OFERTA CONTRATADA\",\"RG_CSV\":\"RG\",\"FORMA_PAGAMENTO_CSV\":\"PAGAMENTO - FORMA DE PAGAMENTO\",\"VENCIMENTO_CSV\":\"PAGAMENTO - VENCIMENTO\",\"PAG_CONTA_ONLINE_CSV\":\"PAGAMENTO - CONTA ONLINE\",\"PAG_BANCO_CSV\":\"PAGAMENTO - BANCO\",\"PAG_AGENCIA_CSV\":\"PAGAMENTO - AGÊNCIA\",\"PAG_CONTA_CSV\":\"PAGAMENTO - CONTA\",\"PAG_AGENCIA_DIGITO_CSV\":\"PAGAMENTO - DIGITO\",\"PAG_OPERACAO_CSV\":\"PAGAMENTO - OPERAÇÃO\",\"OBS_VENDEDOR_CSV\":\"OBSERVAÇÃO VENDEDOR\",\"CEP_INSTALACAO_CSV\":\"INSTALAÇÃO - CEP\",\"LOGRADOURO_INSTALACAO_CSV\":\"INSTALAÇÃO - LOGRADOURO\",\"NUM_INSTALACAO_CSV\":\"INSTALAÇÃO - NÚMERO\",\"BAIRRO_INSTALACAO_CSV\":\"INSTALAÇÃO - BAIRRO\",\"CIDADE_INSTALACAO_CSV\":\"INSTALAÇÃO - CIDADE\",\"UF_INSTALACAO_CSV\":\"INSTALAÇÃO - ESTADO\",\"REF_INSTALACAO_CSV\":\"INSTALAÇÃO - REFERÊNCIA\",\"REFE_COMPLEMENTO1_TIPO_CSV\":\"INSTALAÇÃO - COMPLEMENTO 1 - TIPO\",\"REFE_COMPLEMENTO1_CSV\":\"INSTALAÇÃO - COMPLEMENTO 1\",\"REFE_COMPLEMENTO2_TIPO_CSV\":\"INSTALAÇÃO - COMPLEMENTO 2 - TIPO\",\"REFE_COMPLEMENTO2_CSV\":\"INSTALAÇÃO - COMPLEMENTO 2\",\"REFE_COMPLEMENTO3_TIPO_CSV\":\"INSTALAÇÃO - COMPLEMENTO 3 - TIPO\",\"REFE_COMPLEMENTO3_CSV\":\"INSTALAÇÃO - COMPLEMENTO 3\"}', '{\"NUMERO_PEDIDO\":\"Num OS\",\"STATUS\":\"Status BOV\",\"FLG_MIG_COBRE_VELOX\":\"Migracao Velox\",\"FLG_MIG_COBRE_FIXO\":\"Migracao Fixo\",\"DATA_STATUS\":\"Data instalacao\"}', '{\"NOME\":\"NOME\",\"CPF\":\"CPF\",\"EMAIL\":\"EMAIL\",\"CONTATO1\":\"CONTATO 1\",\"CONTATO2\":\"CONTATO 2\",\"CONTATO3\":\"CONTATO 3\",\"CONTATO4\":\"CONTATO 4\",\"CEP\":\"CEP\",\"UF\":\"UF\",\"CIDADE\":\"CIDADE\",\"BAIRRO\":\"BAIRRO\",\"LOGRADOURO\":\"LOGRADOURO\",\"NUM_FACHADA\":\"NUM FACHADA\"}');


CREATE TABLE parametro_bov_csv (
  id int(11) NOT NULL,
  numero_pedido varchar(50) NOT NULL,
  produto varchar(50) NOT NULL,
  data_status varchar(50) NOT NULL,
  status varchar(50) NOT NULL,
  flg_venda_valida varchar(50) NOT NULL,
  flg_mig_cobre_fixo varchar(50) DEFAULT NULL,
  flg_mig_cobre_velox varchar(50) NOT NULL,
  plano varchar(50) NOT NULL,
  id_bundle varchar(50) NOT NULL,
  cpf_cnpj varchar(50) NOT NULL,
  submotivo varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO parametro_bov_csv (id, numero_pedido, produto, data_status, status, flg_venda_valida, flg_mig_cobre_fixo, flg_mig_cobre_velox, plano, id_bundle, cpf_cnpj, submotivo) VALUES
(2, 'NUMERO_PEDIDO', 'PRODUTO', 'DATA_STATUS', 'STATUS', 'FLG_VENDA_VALIDA', 'FLG_MIG_COBRE_FIXO', 'FLG_MIG_COBRE_VELOX', 'PLANO', 'ID_BUNDLE', 'CPF/CNPJ', 'SUBMOTIVO');


CREATE TABLE parametro_dfv_csv (
  id int(11) NOT NULL,
  uf varchar(30) NOT NULL,
  municipio varchar(30) NOT NULL,
  logradouro varchar(30) NOT NULL,
  num_fachada varchar(30) NOT NULL,
  complemento varchar(30) NOT NULL,
  complemento2 varchar(30) NOT NULL,
  complemento3 varchar(30) NOT NULL,
  cep varchar(30) NOT NULL,
  bairro varchar(30) NOT NULL,
  tipo_viabilidade varchar(30) NOT NULL,
  nome_cdo varchar(30) NOT NULL,
  cod_logradouro varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO parametro_dfv_csv (id, uf, municipio, logradouro, num_fachada, complemento, complemento2, complemento3, cep, bairro, tipo_viabilidade, nome_cdo, cod_logradouro) VALUES
(1, 'UF', 'MUNICIPIO', 'LOGRADOURO', 'NUM_FACHADA', 'COMPLEMENTO', 'COMPLEMENTO2', 'COMPLEMENTO3', 'CEP', 'BAIRRO', 'TIPO_VIABILIDADE', 'NOME_CDO', 'COD_LOGRADOURO');


CREATE TABLE parametro_linha_pgto_csv (
  id int(11) NOT NULL,
  cod_sap varchar(50) NOT NULL,
  valor varchar(50) NOT NULL,
  num_os varchar(50) NOT NULL,
  data_instalacao varchar(50) NOT NULL,
  filial varchar(50) DEFAULT NULL,
  ciclo varchar(50) DEFAULT NULL,
  quinzena varchar(50) NOT NULL,
  cpf_cliente varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO parametro_linha_pgto_csv (id, cod_sap, valor, num_os, data_instalacao, filial, ciclo, quinzena, cpf_cliente) VALUES
(1, 'COD_SAP', 'VALOR', 'NUM_OS', 'DATA_INSTALACAO', 'FILIAL', 'CICLO', 'QUINZENA', 'CPF_CLIENTE');


CREATE TABLE parametro_sistema (
  id int(11) NOT NULL,
  email_suporte varchar(100) NOT NULL,
  envia_email_usuario char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO parametro_sistema (id, email_suporte, envia_email_usuario) VALUES
(1, 'suporte@arkivar.net', 'N');


CREATE TABLE parametro_venda_lote_csv (
  id int(11) NOT NULL,
  dt_venda_csv varchar(50) NOT NULL,
  nome_cliente_csv varchar(50) NOT NULL,
  genero_csv varchar(50) NOT NULL,
  dt_nascimento_csv varchar(50) NOT NULL,
  cpf_cnpj_csv varchar(50) NOT NULL,
  rg_csv varchar(50) NOT NULL,
  orgao_expedidor_csv varchar(50) NOT NULL,
  nome_mae_csv varchar(50) NOT NULL,
  contato_principal_csv varchar(50) NOT NULL,
  contato_secundario_csv varchar(50) NOT NULL,
  email_csv varchar(50) NOT NULL,
  matricula_vendedor_csv varchar(50) NOT NULL,
  banda_larga_velocidade_csv varchar(50) NOT NULL,
  combo_contratado_csv varchar(50) NOT NULL,
  plano_tv_csv varchar(50) NOT NULL,
  forma_pagamento_csv varchar(50) NOT NULL,
  vencimento_csv varchar(50) NOT NULL,
  pag_banco_csv varchar(50) NOT NULL,
  pag_agencia_csv varchar(50) NOT NULL,
  pag_conta_csv varchar(50) NOT NULL,
  pag_agencia_digito_csv varchar(50) NOT NULL,
  pag_operacao_csv varchar(50) NOT NULL,
  obs_vendedor_csv varchar(50) NOT NULL,
  cep_instalacao_csv varchar(50) NOT NULL,
  logradouro_instalacao_csv varchar(50) NOT NULL,
  num_instalacao_csv varchar(50) NOT NULL,
  bairro_instalacao_csv varchar(50) NOT NULL,
  cidade_instalacao_csv varchar(50) NOT NULL,
  uf_instalacao_csv varchar(50) NOT NULL,
  ref_instalacao_csv varchar(50) NOT NULL,
  refe_complemento1_tipo_csv varchar(50) NOT NULL,
  refe_complemento1_csv varchar(50) NOT NULL,
  refe_complemento2_tipo_csv varchar(50) NOT NULL,
  refe_complemento2_csv varchar(50) NOT NULL,
  refe_complemento3_tipo_csv varchar(50) NOT NULL,
  refe_complemento3_csv varchar(50) NOT NULL,
  pag_conta_online_csv varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO parametro_venda_lote_csv (id, dt_venda_csv, nome_cliente_csv, genero_csv, dt_nascimento_csv, cpf_cnpj_csv, rg_csv, orgao_expedidor_csv, nome_mae_csv, contato_principal_csv, contato_secundario_csv, email_csv, matricula_vendedor_csv, banda_larga_velocidade_csv, combo_contratado_csv, plano_tv_csv, forma_pagamento_csv, vencimento_csv, pag_banco_csv, pag_agencia_csv, pag_conta_csv, pag_agencia_digito_csv, pag_operacao_csv, obs_vendedor_csv, cep_instalacao_csv, logradouro_instalacao_csv, num_instalacao_csv, bairro_instalacao_csv, cidade_instalacao_csv, uf_instalacao_csv, ref_instalacao_csv, refe_complemento1_tipo_csv, refe_complemento1_csv, refe_complemento2_tipo_csv, refe_complemento2_csv, refe_complemento3_tipo_csv, refe_complemento3_csv, pag_conta_online_csv) VALUES
(3, 'DATA EM QUE O PEDIDO FOI REALIZADO', 'NOME CLIENTE', 'GÊNERO', 'DATA DE NASCIMENTO', 'CPF', 'RG', 'ÓRGÃO EXPEDIDOR', 'NOME COMPLETO DA MÃE', 'CONTATO PRINCIPAL', 'CONTATO SECUNDÁRIO', 'E-MAIL', 'MATRICULA VENDEDOR', 'BANDA LARGA - VELOCIDADE', 'COMBO/OFERTA CONTRATADA', 'TV - PLANO TV', 'PAGAMENTO - FORMA DE PAGAMENTO', 'PAGAMENTO - VENCIMENTO', 'PAGAMENTO - BANCO', 'PAGAMENTO - AGÊNCIA', 'PAGAMENTO - CONTA', 'PAGAMENTO - DIGITO', 'PAGAMENTO - OPERAÇÃO', 'OBSERVAÇÃO VENDEDOR', 'INSTALAÇÃO - CEP', 'INSTALAÇÃO - LOGRADOURO', 'INSTALAÇÃO - NÚMERO', 'INSTALAÇÃO - BAIRRO', 'INSTALAÇÃO - CIDADE', 'INSTALAÇÃO - ESTADO', 'INSTALAÇÃO - REFERÊNCIA', 'INSTALAÇÃO - COMPLEMENTO 1 - TIPO', 'INSTALAÇÃO - COMPLEMENTO 1', 'INSTALAÇÃO - COMPLEMENTO 2 - TIPO', 'INSTALAÇÃO - COMPLEMENTO 2', 'INSTALAÇÃO - COMPLEMENTO 3 - TIPO', 'INSTALAÇÃO - COMPLEMENTO 3', 'Pagamento - Conta Online');

CREATE TABLE peso_dias (
  data date NOT NULL,
  peso decimal(2,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE planos_operadora (
  id int(11) NOT NULL,
  id_fibra int(11) NOT NULL,
  id_tv int(11) DEFAULT NULL,
  valor_faturamento decimal(5,2) NOT NULL,
  dt_ini date NOT NULL,
  dt_fim date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE plano_fibra (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO plano_fibra (id, descricao) VALUES
(4, '200 Mega'),
(5, '100 Mega'),
(6, '400 Mega'),
(7, '500 Mega'),
(8, '1 Giga');

CREATE TABLE plano_tv (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO plano_tv (id, descricao) VALUES
(4, 'Oi TV Total HD'),
(5, 'Oi TV Total HD DVR');

CREATE TABLE senha_email (
  id int(11) NOT NULL,
  data datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  usuario int(11) NOT NULL,
  senha_temp varchar(100) NOT NULL,
  status char(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE setor_tratamento_vendas (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO setor_tratamento_vendas (id, descricao) VALUES
(4, 'BKO'),
(5, 'COMERCIAL'),
(6, 'OPERADORA');



CREATE TABLE status_ativacoes (
  id int(11) NOT NULL,
  descricao varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO status_ativacoes (id, descricao) VALUES
(5, 'ATIVADO'),
(6, 'ATIVO OUTRO PDV'),
(7, 'CREDITO RECUSADO'),
(8, 'DERIVADO'),
(9, 'DESISTENCIA CLIENTE'),
(10, 'EMAIL SUPORTE'),
(11, 'ENVIADO GC'),
(12, 'ERRO SISTEMICO'),
(13, 'EZ-CONECT'),
(14, 'FOTO CDOE'),
(15, 'OS - 30 DIAS'),
(16, 'POSSUI FIBRA'),
(17, 'REPROVADO QUALITY'),
(18, 'ROUBO VENDA'),
(19, 'SEM VIABILIDADE'),
(20, 'VIABILIDADE PARCIAL'),
(21, 'NEGADO BRPRONTO'),
(22, 'REFAZER 360');



CREATE TABLE tipo_contratacao (
  id int(11) NOT NULL,
  descricao varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO tipo_contratacao (id, descricao) VALUES
(1, 'CLT'),
(2, 'FREELANCER'),
(3, 'FIXO');



CREATE TABLE tipo_meta (
  id int(11) NOT NULL,
  competencia date NOT NULL,
  tipo int(11) NOT NULL COMMENT '1 = quantidade, 2 = faturamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE tipo_turno (
  id int(11) NOT NULL,
  descricao varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO tipo_turno (id, descricao) VALUES
(1, 'Manha'),
(2, 'Tarde');



CREATE TABLE uf_atuacao (
  id int(11) NOT NULL,
  uf varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE ultima_bov (
  numero_pedido varchar(20) NOT NULL,
  data_status date DEFAULT NULL,
  status varchar(30) DEFAULT NULL,
  flg_mig_cobre_fixo char(1) DEFAULT NULL,
  flg_mig_cobre_velox char(1) DEFAULT NULL,
  dt_upload date DEFAULT NULL,
  id_usuario int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE usuarios (
  id int(11) NOT NULL,
  nome varchar(100) NOT NULL,
  grupo int(11) DEFAULT NULL,
  status char(1) NOT NULL COMMENT 'A=ATIVO, I=INATIVO, D=DESLIGADO,C=AGUARDANDO CONFIRMACAO',
  email varchar(100) NOT NULL,
  usuario varchar(20) NOT NULL,
  senha varchar(100) NOT NULL,
  foto varchar(100) DEFAULT NULL,
  equipe_id int(11) DEFAULT NULL,
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO usuarios (id, nome, grupo, status, email, usuario, senha, foto, equipe_id, created_at, updated_at) VALUES
(1, 'suporte', 1, 'A', 'vagner.cerqueira@live.com', 'suporte', '$2y$10$46UoLJSkPLMM3nB30C4lFOnS8SobxFN7vT97Hu7S/YmA3e.zcpuiG', 'suporte.jpg', NULL, now(), now());



CREATE TABLE vendas (
  id int(11) NOT NULL,
  dt_venda_csv date DEFAULT NULL,
  dt_ativacao date DEFAULT NULL,
  dt_instalacao date DEFAULT NULL,
  dt_agendamento date DEFAULT NULL,
  dt_reagendamento_1 date DEFAULT NULL,
  dt_reagendamento_2 date DEFAULT NULL,
  dt_reagendamento_3 date DEFAULT NULL,
  dt_reagendamento_4 date DEFAULT NULL,
  dt_reagendamento_5 date DEFAULT NULL,
  turno_agendamento int(11) DEFAULT NULL,
  turno_reagendamento_1 int(11) DEFAULT NULL,
  turno_reagendamento_2 int(11) DEFAULT NULL,
  turno_reagendamento_3 int(11) DEFAULT NULL,
  turno_reagendamento_4 int(11) DEFAULT NULL,
  turno_reagendamento_5 int(11) DEFAULT NULL,
  edit_usuario_id int(11) DEFAULT NULL,
  edit_data datetime DEFAULT NULL,
  insert_usuario_id int(11) NOT NULL,
  insert_data datetime NOT NULL,
  num_pedido_csv varchar(20) DEFAULT NULL,
  nome_cliente_csv varchar(100) NOT NULL,
  genero_csv char(1) DEFAULT NULL,
  dt_nascimento_csv date DEFAULT NULL,
  cpf_cnpj_csv varchar(14) NOT NULL,
  rg_csv varchar(20) DEFAULT NULL,
  orgao_expedidor_csv varchar(20) DEFAULT NULL,
  nome_mae_csv varchar(100) DEFAULT NULL,
  contato_principal_csv varchar(14) NOT NULL,
  contato_secundario_csv varchar(14) DEFAULT NULL,
  email_csv varchar(50) DEFAULT NULL,
  matricula_vendedor_csv varchar(8) DEFAULT NULL,
  banda_larga_velocidade_csv int(11) NOT NULL,
  plano_tv_csv int(11) DEFAULT NULL,
  combo_contratado_csv int(11) NOT NULL,
  forma_pagamento_csv int(11) NOT NULL,
  vencimento_csv decimal(2,0) NOT NULL,
  pag_conta_online_csv varchar(3) NOT NULL,
  pag_banco_csv int(11) DEFAULT NULL,
  pag_agencia_csv varchar(10) DEFAULT NULL,
  pag_conta_csv varchar(10) DEFAULT NULL,
  pag_agencia_digito_csv decimal(1,0) DEFAULT NULL,
  pag_operacao_csv varchar(10) DEFAULT NULL,
  obs_vendedor_csv varchar(500) DEFAULT NULL,
  cep_instalacao_csv varchar(8) NOT NULL,
  logradouro_instalacao_csv varchar(100) NOT NULL,
  num_instalacao_csv varchar(5) DEFAULT NULL,
  bairro_instalacao_csv varchar(100) NOT NULL,
  cidade_instalacao_csv varchar(100) NOT NULL,
  uf_instalacao_csv varchar(2) NOT NULL,
  ref_instalacao_csv varchar(100) NOT NULL,
  refe_complemento1_tipo_csv varchar(100) DEFAULT NULL,
  refe_complemento1_csv varchar(100) DEFAULT NULL,
  refe_complemento2_tipo_csv varchar(100) DEFAULT NULL,
  refe_complemento2_csv varchar(100) DEFAULT NULL,
  refe_complemento3_tipo_csv varchar(100) DEFAULT NULL,
  refe_complemento3_csv varchar(13) DEFAULT NULL,
  status_bov varchar(20) DEFAULT NULL,
  ddd_bov float(3,0) DEFAULT NULL,
  mig_cobre_fixo_bov char(1) DEFAULT NULL,
  mig_cobre_velox_bov char(1) DEFAULT NULL,
  data_status_bov date DEFAULT NULL,
  desc_bov varchar(200) DEFAULT NULL,
  num_os varchar(15) DEFAULT NULL,
  id_bundle varchar(10) DEFAULT NULL,
  id_vendedor int(11) DEFAULT NULL,
  id_supervisor int(11) DEFAULT NULL,
  equipe varchar(100) NOT NULL,
  obs_ativacao varchar(500) DEFAULT NULL,
  obs_tratamento_bko varchar(1000) DEFAULT NULL,
  obs_tratamento_supervisor varchar(1000) DEFAULT NULL,
  setor_resp_tratamento varchar(20) DEFAULT NULL,
  dt_retorno_tratamento date DEFAULT NULL,
  status_tratamento varchar(15) DEFAULT NULL,
  status_ativacao int(11) DEFAULT NULL,
  zap_agendamento1 char(1) DEFAULT NULL,
  zap_reagendamento_1 char(1) DEFAULT NULL,
  zap_reagendamento_2 char(1) DEFAULT NULL,
  zap_reagendamento_3 char(1) DEFAULT NULL,
  zap_reagendamento_4 char(1) DEFAULT NULL,
  zap_reagendamento_5 char(1) DEFAULT NULL,
  status_blindagem char(1) DEFAULT NULL,
  audio_audit_quality_1 varchar(200) DEFAULT NULL,
  audio_audit_quality_2 varchar(200) DEFAULT NULL,
  vi_ve char(1) DEFAULT NULL,
  viabilidade char(1) DEFAULT NULL,
  faturamento decimal(5,2) NOT NULL,
  fibra_bov varchar(50) NOT NULL,
  tv_box varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE acesso_grupo
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY id_grupo_2 (id_grupo,id_aplicacao),
  ADD KEY id_grupo (id_grupo),
  ADD KEY id_aplicacao (id_aplicacao);

ALTER TABLE acesso_usuario
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY id_usuario (id_usuario,id_aplicacao),
  ADD KEY id_aplicacao (id_aplicacao);


ALTER TABLE aplicacoes
  ADD PRIMARY KEY (id),
  ADD KEY id_pai (id_pai);

ALTER TABLE auditar_log
  ADD PRIMARY KEY (id),
  ADD KEY id_user (id_user);


ALTER TABLE bancos_permitidos
  ADD PRIMARY KEY (id);


ALTER TABLE combo_planos
  ADD PRIMARY KEY (id);


ALTER TABLE dias_vencimento
  ADD PRIMARY KEY (id);


ALTER TABLE equipe_usuario
  ADD PRIMARY KEY (id),
  ADD KEY supervisor (supervisor);


ALTER TABLE forma_pagamento
  ADD PRIMARY KEY (id);


ALTER TABLE grupo_envio_emails
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY id_grupo (id_grupo);


ALTER TABLE grupo_usuario
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY cod_interno (cod_interno);


ALTER TABLE linha_pgto
  ADD PRIMARY KEY (id),
  ADD KEY quinzena (quinzena),
  ADD KEY data_instalacao (data_instalacao),
  ADD KEY num_os (num_os);


ALTER TABLE mailing_clientes
  ADD KEY cpf (cpf),
  ADD KEY cep (cep),
  ADD KEY cep_2 (cep,num_fachada),
  ADD KEY nome_mailing (nome_mailing),
  ADD KEY cidade (cidade);


ALTER TABLE mensagem_whatsapp
  ADD PRIMARY KEY (id);


ALTER TABLE metas
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY competencia (competencia,equipe),
  ADD KEY tipo (tipo),
  ADD KEY equipe (equipe);


ALTER TABLE meta_vendedor
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY competencia (competencia,equipe),
  ADD KEY equipe (equipe);


ALTER TABLE parametros_uploads_csv
  ADD PRIMARY KEY (id);


ALTER TABLE parametro_bov_csv
  ADD PRIMARY KEY (id);


ALTER TABLE parametro_dfv_csv
  ADD PRIMARY KEY (id);


ALTER TABLE parametro_linha_pgto_csv
  ADD PRIMARY KEY (id);


ALTER TABLE parametro_sistema
  ADD PRIMARY KEY (id);


ALTER TABLE parametro_venda_lote_csv
  ADD PRIMARY KEY (id);


ALTER TABLE peso_dias
  ADD PRIMARY KEY (data);


ALTER TABLE planos_operadora
  ADD PRIMARY KEY (id),
  ADD KEY id_fibra (id_fibra),
  ADD KEY id_tv (id_tv);


ALTER TABLE plano_fibra
  ADD PRIMARY KEY (id);


ALTER TABLE plano_tv
  ADD PRIMARY KEY (id);


ALTER TABLE senha_email
  ADD PRIMARY KEY (id),
  ADD KEY senha_email_ibfk_1 (usuario);


ALTER TABLE setor_tratamento_vendas
  ADD PRIMARY KEY (id);


ALTER TABLE status_ativacoes
  ADD PRIMARY KEY (id);


ALTER TABLE tipo_contratacao
  ADD PRIMARY KEY (id);


ALTER TABLE tipo_meta
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY competencia (competencia,tipo);


ALTER TABLE tipo_turno
  ADD PRIMARY KEY (id);


ALTER TABLE uf_atuacao
  ADD PRIMARY KEY (id);


ALTER TABLE ultima_bov
  ADD PRIMARY KEY (numero_pedido);


ALTER TABLE usuarios
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY usuario (usuario),
  ADD KEY grupo (grupo);

ALTER TABLE vendas
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY num_os (num_os),
  ADD KEY turno_agendamento (turno_agendamento),
  ADD KEY turno_reagendamento_1 (turno_reagendamento_1),
  ADD KEY turno_reagendamento_2 (turno_reagendamento_2),
  ADD KEY turno_reagendamento_3 (turno_reagendamento_3),
  ADD KEY turno_reagendamento_4 (turno_reagendamento_4),
  ADD KEY turno_reagendamento_5 (turno_reagendamento_5),
  ADD KEY edit_usuario_id (edit_usuario_id),
  ADD KEY insert_usuario_id (insert_usuario_id),
  ADD KEY status_ativacao (status_ativacao),
  ADD KEY id_vendedor (id_vendedor),
  ADD KEY id_supervisor (id_supervisor),
  ADD KEY pag_banco_csv (pag_banco_csv),
  ADD KEY banda_larga_velocidade_csv (banda_larga_velocidade_csv),
  ADD KEY combo_contratado_csv (combo_contratado_csv);


ALTER TABLE acesso_grupo
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE acesso_usuario
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE aplicacoes
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;


ALTER TABLE auditar_log
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE bancos_permitidos
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE combo_planos
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE dias_vencimento
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE equipe_usuario
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE forma_pagamento
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE grupo_envio_emails
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE grupo_usuario
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE linha_pgto
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE mensagem_whatsapp
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE metas
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE meta_vendedor
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE parametros_uploads_csv
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE parametro_bov_csv
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE parametro_dfv_csv
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE parametro_linha_pgto_csv
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE parametro_sistema
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE parametro_venda_lote_csv
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE planos_operadora
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE plano_fibra
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE plano_tv
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE senha_email
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE setor_tratamento_vendas
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE status_ativacoes
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;


ALTER TABLE tipo_contratacao
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE tipo_meta
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE tipo_turno
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE uf_atuacao
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE usuarios
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE vendas
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE acesso_grupo
  ADD CONSTRAINT acesso_grupo_ibfk_1 FOREIGN KEY (id_aplicacao) REFERENCES aplicacoes (id),
  ADD CONSTRAINT acesso_grupo_ibfk_2 FOREIGN KEY (id_grupo) REFERENCES grupo_usuario (id);


ALTER TABLE acesso_usuario
  ADD CONSTRAINT acesso_usuario_ibfk_1 FOREIGN KEY (id_aplicacao) REFERENCES aplicacoes (id),
  ADD CONSTRAINT acesso_usuario_ibfk_2 FOREIGN KEY (id_usuario) REFERENCES usuarios (id);


ALTER TABLE auditar_log
  ADD CONSTRAINT auditar_log_ibfk_1 FOREIGN KEY (id_user) REFERENCES usuarios (id);


ALTER TABLE equipe_usuario
  ADD CONSTRAINT equipe_usuario_ibfk_1 FOREIGN KEY (supervisor) REFERENCES usuarios (id);

ALTER TABLE grupo_envio_emails
  ADD CONSTRAINT grupo_envio_emails_ibfk_1 FOREIGN KEY (id_grupo) REFERENCES grupo_usuario (id);


ALTER TABLE metas
  ADD CONSTRAINT metas_ibfk_2 FOREIGN KEY (equipe) REFERENCES equipe_usuario (id);


ALTER TABLE meta_vendedor
  ADD CONSTRAINT meta_vendedor_ibfk_1 FOREIGN KEY (equipe) REFERENCES equipe_usuario (id);


ALTER TABLE planos_operadora
  ADD CONSTRAINT planos_operadora_ibfk_1 FOREIGN KEY (id_fibra) REFERENCES plano_fibra (id),
  ADD CONSTRAINT planos_operadora_ibfk_2 FOREIGN KEY (id_tv) REFERENCES plano_tv (id);


ALTER TABLE senha_email
  ADD CONSTRAINT senha_email_ibfk_1 FOREIGN KEY (usuario) REFERENCES usuarios (id);


ALTER TABLE usuarios
  ADD CONSTRAINT usuarios_ibfk_1 FOREIGN KEY (grupo) REFERENCES grupo_usuario (id);


ALTER TABLE vendas
  ADD CONSTRAINT vendas_ibfk_1 FOREIGN KEY (turno_agendamento) REFERENCES tipo_turno (id),
  ADD CONSTRAINT vendas_ibfk_10 FOREIGN KEY (id_vendedor) REFERENCES usuarios (id),
  ADD CONSTRAINT vendas_ibfk_11 FOREIGN KEY (id_supervisor) REFERENCES usuarios (id),
  ADD CONSTRAINT vendas_ibfk_12 FOREIGN KEY (pag_banco_csv) REFERENCES bancos_permitidos (id),
  ADD CONSTRAINT vendas_ibfk_13 FOREIGN KEY (banda_larga_velocidade_csv) REFERENCES plano_fibra (id),
  ADD CONSTRAINT vendas_ibfk_14 FOREIGN KEY (combo_contratado_csv) REFERENCES combo_planos (id),
  ADD CONSTRAINT vendas_ibfk_2 FOREIGN KEY (turno_reagendamento_1) REFERENCES tipo_turno (id),
  ADD CONSTRAINT vendas_ibfk_3 FOREIGN KEY (turno_reagendamento_2) REFERENCES tipo_turno (id),
  ADD CONSTRAINT vendas_ibfk_4 FOREIGN KEY (turno_reagendamento_3) REFERENCES tipo_turno (id),
  ADD CONSTRAINT vendas_ibfk_5 FOREIGN KEY (turno_reagendamento_4) REFERENCES tipo_turno (id),
  ADD CONSTRAINT vendas_ibfk_6 FOREIGN KEY (turno_reagendamento_5) REFERENCES tipo_turno (id),
  ADD CONSTRAINT vendas_ibfk_7 FOREIGN KEY (edit_usuario_id) REFERENCES usuarios (id),
  ADD CONSTRAINT vendas_ibfk_8 FOREIGN KEY (insert_usuario_id) REFERENCES usuarios (id),
  ADD CONSTRAINT vendas_ibfk_9 FOREIGN KEY (status_ativacao) REFERENCES status_ativacoes (id);
COMMIT;


CREATE TABLE `acompanhamento_cliente` (
  `id` int(11) NOT NULL,
  `dt_update` datetime DEFAULT NULL,
  `edit_usuario_id` int(11) DEFAULT NULL,
  `num_os` varchar(15) NOT NULL,
  `zap_m_0` char(1) DEFAULT NULL,
  `zap_m_1` char(1) DEFAULT NULL,
  `zap_m_2` char(1) DEFAULT NULL,
  `zap_m_3` char(1) DEFAULT NULL,
  `zap_m_4` char(1) DEFAULT NULL,
  `ativo` char(1) DEFAULT 'N',
  `adimplente` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `acompanhamento_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `num_os` (`num_os`),
  ADD KEY `edit_usuario_id` (`edit_usuario_id`);

ALTER TABLE `acompanhamento_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;