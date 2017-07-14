--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2017-07-13 21:43:57 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 16879)
-- Name: administradores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE administradores (
    codigo_usuario integer NOT NULL,
    email character varying(45) NOT NULL,
    senha character varying(45) NOT NULL,
    nome character varying(50) NOT NULL,
    ativo boolean DEFAULT true
);


ALTER TABLE administradores OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16877)
-- Name: administradores_codigo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE administradores_codigo_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administradores_codigo_usuario_seq OWNER TO postgres;

--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 181
-- Name: administradores_codigo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE administradores_codigo_usuario_seq OWNED BY administradores.codigo_usuario;


--
-- TOC entry 201 (class 1259 OID 17072)
-- Name: candidatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE candidatura (
    codigo_vaga integer NOT NULL,
    codigo_candidato integer NOT NULL,
    parecer character varying(255)
);


ALTER TABLE candidatura OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17070)
-- Name: candidatura_codigo_vaga_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE candidatura_codigo_vaga_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE candidatura_codigo_vaga_seq OWNER TO postgres;

--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 200
-- Name: candidatura_codigo_vaga_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE candidatura_codigo_vaga_seq OWNED BY candidatura.codigo_vaga;


--
-- TOC entry 184 (class 1259 OID 16890)
-- Name: cargos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cargos (
    codigo_cargo integer NOT NULL,
    descricao character varying(255) NOT NULL
);


ALTER TABLE cargos OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16888)
-- Name: cargos_codigo_cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cargos_codigo_cargo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cargos_codigo_cargo_seq OWNER TO postgres;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 183
-- Name: cargos_codigo_cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cargos_codigo_cargo_seq OWNED BY cargos.codigo_cargo;


--
-- TOC entry 193 (class 1259 OID 16954)
-- Name: cargos_pretendidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cargos_pretendidos (
    codigo_cargo integer NOT NULL,
    codigo_curriculo integer NOT NULL
);


ALTER TABLE cargos_pretendidos OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16917)
-- Name: cidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cidades (
    codigo_cidade integer NOT NULL,
    nome_cidade character varying(50) NOT NULL,
    codigo_estado integer NOT NULL
);


ALTER TABLE cidades OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16915)
-- Name: cidades_codigo_cidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cidades_codigo_cidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cidades_codigo_cidade_seq OWNER TO postgres;

--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 189
-- Name: cidades_codigo_cidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidades_codigo_cidade_seq OWNED BY cidades.codigo_cidade;


--
-- TOC entry 192 (class 1259 OID 16930)
-- Name: curriculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE curriculo (
    idcurriculo integer NOT NULL,
    cidade_residencia integer NOT NULL,
    pretencao_salarial double precision,
    nome character varying(150) NOT NULL,
    estado_civil integer NOT NULL,
    data_nascimento date NOT NULL,
    cpf character varying(15) DEFAULT NULL::character varying,
    endereco character varying(255) DEFAULT NULL::character varying,
    bairro character varying(50) DEFAULT NULL::character varying,
    telefone character varying(50) DEFAULT NULL::character varying,
    celular character varying(50) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    senha character varying(50) DEFAULT NULL::character varying,
    observacoes character varying(255) DEFAULT NULL::character varying,
    pdf character varying(50) DEFAULT NULL::character varying,
    foto character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE curriculo OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16928)
-- Name: curriculo_idcurriculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE curriculo_idcurriculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE curriculo_idcurriculo_seq OWNER TO postgres;

--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 191
-- Name: curriculo_idcurriculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE curriculo_idcurriculo_seq OWNED BY curriculo.idcurriculo;


--
-- TOC entry 186 (class 1259 OID 16898)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cursos (
    codigo_curso integer NOT NULL,
    nome_curso character varying(255) DEFAULT NULL::character varying,
    nivel integer
);


ALTER TABLE cursos OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16896)
-- Name: cursos_codigo_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cursos_codigo_curso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cursos_codigo_curso_seq OWNER TO postgres;

--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 185
-- Name: cursos_codigo_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cursos_codigo_curso_seq OWNED BY cursos.codigo_curso;


--
-- TOC entry 188 (class 1259 OID 16907)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    codigo_estado integer NOT NULL,
    nome_estado character varying(45) DEFAULT NULL::character varying,
    sigla character varying(2) DEFAULT NULL::character varying
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16905)
-- Name: estado_codigo_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_codigo_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_codigo_estado_seq OWNER TO postgres;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 187
-- Name: estado_codigo_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_codigo_estado_seq OWNED BY estado.codigo_estado;


--
-- TOC entry 195 (class 1259 OID 16971)
-- Name: experiencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE experiencia (
    codigo_experiencia integer NOT NULL,
    nome_empresa character varying(255) NOT NULL,
    atividades_desempenhadas character varying(255) DEFAULT NULL::character varying,
    ultimo_cargo_ocupado integer NOT NULL,
    data_de date NOT NULL,
    data_ate date,
    codigo_curriculo integer NOT NULL
);


ALTER TABLE experiencia OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16969)
-- Name: experiencia_codigo_experiencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE experiencia_codigo_experiencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE experiencia_codigo_experiencia_seq OWNER TO postgres;

--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 194
-- Name: experiencia_codigo_experiencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE experiencia_codigo_experiencia_seq OWNED BY experiencia.codigo_experiencia;


--
-- TOC entry 199 (class 1259 OID 17001)
-- Name: formacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE formacao (
    codigo_formacao integer NOT NULL,
    curso integer NOT NULL,
    outros character varying(255) DEFAULT NULL::character varying,
    concluido boolean,
    inicio date NOT NULL,
    fim date,
    codigo_instituicao integer NOT NULL,
    codigo_curriculo integer NOT NULL
);


ALTER TABLE formacao OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16999)
-- Name: formacao_codigo_formacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formacao_codigo_formacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE formacao_codigo_formacao_seq OWNER TO postgres;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 198
-- Name: formacao_codigo_formacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formacao_codigo_formacao_seq OWNED BY formacao.codigo_formacao;


--
-- TOC entry 197 (class 1259 OID 16993)
-- Name: instituicoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE instituicoes (
    codigo_instituicao integer NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE instituicoes OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16991)
-- Name: instituicoes_codigo_instituicao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE instituicoes_codigo_instituicao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE instituicoes_codigo_instituicao_seq OWNER TO postgres;

--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 196
-- Name: instituicoes_codigo_instituicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE instituicoes_codigo_instituicao_seq OWNED BY instituicoes.codigo_instituicao;


--
-- TOC entry 203 (class 1259 OID 17118)
-- Name: vagas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vagas (
    idvagas integer NOT NULL,
    aberto_ate date NOT NULL,
    descricao character varying(255) NOT NULL,
    requisitos character varying(255) NOT NULL,
    codigo_cidade integer NOT NULL,
    salario double precision NOT NULL,
    titulo character varying(50) NOT NULL,
    candidato_selecionado integer,
    suspender boolean DEFAULT false
);


ALTER TABLE vagas OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17116)
-- Name: vagas_idvagas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vagas_idvagas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vagas_idvagas_seq OWNER TO postgres;

--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 202
-- Name: vagas_idvagas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vagas_idvagas_seq OWNED BY vagas.idvagas;


--
-- TOC entry 2089 (class 2604 OID 16882)
-- Name: codigo_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administradores ALTER COLUMN codigo_usuario SET DEFAULT nextval('administradores_codigo_usuario_seq'::regclass);


--
-- TOC entry 2114 (class 2604 OID 17075)
-- Name: codigo_vaga; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidatura ALTER COLUMN codigo_vaga SET DEFAULT nextval('candidatura_codigo_vaga_seq'::regclass);


--
-- TOC entry 2091 (class 2604 OID 16893)
-- Name: codigo_cargo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargos ALTER COLUMN codigo_cargo SET DEFAULT nextval('cargos_codigo_cargo_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 16920)
-- Name: codigo_cidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidades ALTER COLUMN codigo_cidade SET DEFAULT nextval('cidades_codigo_cidade_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 16933)
-- Name: idcurriculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculo ALTER COLUMN idcurriculo SET DEFAULT nextval('curriculo_idcurriculo_seq'::regclass);


--
-- TOC entry 2092 (class 2604 OID 16901)
-- Name: codigo_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos ALTER COLUMN codigo_curso SET DEFAULT nextval('cursos_codigo_curso_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 16910)
-- Name: codigo_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN codigo_estado SET DEFAULT nextval('estado_codigo_estado_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 16974)
-- Name: codigo_experiencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY experiencia ALTER COLUMN codigo_experiencia SET DEFAULT nextval('experiencia_codigo_experiencia_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 17004)
-- Name: codigo_formacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formacao ALTER COLUMN codigo_formacao SET DEFAULT nextval('formacao_codigo_formacao_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 16996)
-- Name: codigo_instituicao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instituicoes ALTER COLUMN codigo_instituicao SET DEFAULT nextval('instituicoes_codigo_instituicao_seq'::regclass);


--
-- TOC entry 2115 (class 2604 OID 17121)
-- Name: idvagas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vagas ALTER COLUMN idvagas SET DEFAULT nextval('vagas_idvagas_seq'::regclass);


--
-- TOC entry 2270 (class 0 OID 16879)
-- Dependencies: 182
-- Data for Name: administradores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY administradores (codigo_usuario, email, senha, nome, ativo) FROM stdin;
3	lucasleandrodemoura@gmail.com	1234	Lucas Leandro de Moura	t
5	taetaetae@teaeattae.com	atetae	aettaetaetae	t
\.


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 181
-- Name: administradores_codigo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('administradores_codigo_usuario_seq', 5, true);


--
-- TOC entry 2289 (class 0 OID 17072)
-- Dependencies: 201
-- Data for Name: candidatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY candidatura (codigo_vaga, codigo_candidato, parecer) FROM stdin;
1	4	\N
3	4	agga
\.


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 200
-- Name: candidatura_codigo_vaga_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('candidatura_codigo_vaga_seq', 1, false);


--
-- TOC entry 2272 (class 0 OID 16890)
-- Dependencies: 184
-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cargos (codigo_cargo, descricao) FROM stdin;
1	Programador
2	Técnico em informática
\.


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 183
-- Name: cargos_codigo_cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cargos_codigo_cargo_seq', 7, true);


--
-- TOC entry 2281 (class 0 OID 16954)
-- Dependencies: 193
-- Data for Name: cargos_pretendidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cargos_pretendidos (codigo_cargo, codigo_curriculo) FROM stdin;
\.


--
-- TOC entry 2278 (class 0 OID 16917)
-- Dependencies: 190
-- Data for Name: cidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cidades (codigo_cidade, nome_cidade, codigo_estado) FROM stdin;
1	Estrela	1
4	ateaettaetaetae	1
\.


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 189
-- Name: cidades_codigo_cidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cidades_codigo_cidade_seq', 5, true);


--
-- TOC entry 2280 (class 0 OID 16930)
-- Dependencies: 192
-- Data for Name: curriculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY curriculo (idcurriculo, cidade_residencia, pretencao_salarial, nome, estado_civil, data_nascimento, cpf, endereco, bairro, telefone, celular, email, senha, observacoes, pdf, foto) FROM stdin;
4	1	\N	Lucas Leandro de Moura	1	1989-12-29	01664739017	RUA CRUZEIRO DO SUL	Industrias	5191617124	5191617124	lucasleandrodemoura@gmail.com	1234	null	\N	Formatura Técnico em Informática 2012 (28).JPG
\.


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 191
-- Name: curriculo_idcurriculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('curriculo_idcurriculo_seq', 4, true);


--
-- TOC entry 2274 (class 0 OID 16898)
-- Dependencies: 186
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cursos (codigo_curso, nome_curso, nivel) FROM stdin;
4	Análise e Desenvolvimento de Sistemas	3
5	Técnico em Informática	2
6	Computação Aplicada	4
\.


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 185
-- Name: cursos_codigo_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cursos_codigo_curso_seq', 6, true);


--
-- TOC entry 2276 (class 0 OID 16907)
-- Dependencies: 188
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado (codigo_estado, nome_estado, sigla) FROM stdin;
1	Rio Grande do Sul	RS
4	Distrito Federal	DF
\.


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 187
-- Name: estado_codigo_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_codigo_estado_seq', 4, true);


--
-- TOC entry 2283 (class 0 OID 16971)
-- Dependencies: 195
-- Data for Name: experiencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY experiencia (codigo_experiencia, nome_empresa, atividades_desempenhadas, ultimo_cargo_ocupado, data_de, data_ate, codigo_curriculo) FROM stdin;
2	Conpasul Construções e Serviços Ltda	Programador PHP	1	2011-03-01	2017-07-13	4
3	Governo do RS	Professor de curso técnico	2	2013-08-13	2017-07-13	4
5	8Bit Soluções em Ti Ltda	Sócio	1	2017-03-01	2017-07-13	4
\.


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 194
-- Name: experiencia_codigo_experiencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('experiencia_codigo_experiencia_seq', 5, true);


--
-- TOC entry 2287 (class 0 OID 17001)
-- Dependencies: 199
-- Data for Name: formacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY formacao (codigo_formacao, curso, outros, concluido, inicio, fim, codigo_instituicao, codigo_curriculo) FROM stdin;
\.


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 198
-- Name: formacao_codigo_formacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formacao_codigo_formacao_seq', 1, false);


--
-- TOC entry 2285 (class 0 OID 16993)
-- Dependencies: 197
-- Data for Name: instituicoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY instituicoes (codigo_instituicao, nome) FROM stdin;
2	Univates
3	EEEPE
\.


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 196
-- Name: instituicoes_codigo_instituicao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('instituicoes_codigo_instituicao_seq', 5, true);


--
-- TOC entry 2291 (class 0 OID 17118)
-- Dependencies: 203
-- Data for Name: vagas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vagas (idvagas, aberto_ate, descricao, requisitos, codigo_cidade, salario, titulo, candidato_selecionado, suspender) FROM stdin;
1	1969-01-01	eatlkaetlçkaeçlt\r\naeteatçkaeçlkae\r\naetkjaeçlea\r\naetçkjaetçlkae	taetaetaeeattae\r\nte\r\naet\r\naetçkaeçlkeatlçkaetçl\r\n\r\n\r\naetlaekçlaektlçaet\r\naetçkaeçlkaeçlkçl	1	2222	taeeateateat	\N	f
2	1969-01-01	aetaetaeteateattae	taetaetae	1	11111	taeaetaetaet	\N	f
3	2017-09-12	Irá trabalhar em um projeto bancário, realizando codificação conforme demandas apontadas pelos analistas.	Deve ter boa lógica de programação, conhecimento em Java	1	2000	Desenvolvedor	\N	f
\.


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 202
-- Name: vagas_idvagas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vagas_idvagas_seq', 3, true);


--
-- TOC entry 2118 (class 2606 OID 16887)
-- Name: administradores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administradores
    ADD CONSTRAINT administradores_email_key UNIQUE (email);


--
-- TOC entry 2120 (class 2606 OID 16885)
-- Name: administradores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administradores
    ADD CONSTRAINT administradores_pkey PRIMARY KEY (codigo_usuario);


--
-- TOC entry 2140 (class 2606 OID 17077)
-- Name: candidatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidatura
    ADD CONSTRAINT candidatura_pkey PRIMARY KEY (codigo_vaga, codigo_candidato);


--
-- TOC entry 2122 (class 2606 OID 16895)
-- Name: cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (codigo_cargo);


--
-- TOC entry 2132 (class 2606 OID 16958)
-- Name: cargos_pretendidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargos_pretendidos
    ADD CONSTRAINT cargos_pretendidos_pkey PRIMARY KEY (codigo_cargo, codigo_curriculo);


--
-- TOC entry 2128 (class 2606 OID 16922)
-- Name: cidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (codigo_cidade);


--
-- TOC entry 2130 (class 2606 OID 16948)
-- Name: curriculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculo
    ADD CONSTRAINT curriculo_pkey PRIMARY KEY (idcurriculo);


--
-- TOC entry 2124 (class 2606 OID 16904)
-- Name: cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (codigo_curso);


--
-- TOC entry 2126 (class 2606 OID 16914)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (codigo_estado);


--
-- TOC entry 2134 (class 2606 OID 16980)
-- Name: experiencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY experiencia
    ADD CONSTRAINT experiencia_pkey PRIMARY KEY (codigo_experiencia);


--
-- TOC entry 2138 (class 2606 OID 17007)
-- Name: formacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formacao
    ADD CONSTRAINT formacao_pkey PRIMARY KEY (codigo_formacao);


--
-- TOC entry 2136 (class 2606 OID 16998)
-- Name: instituicoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instituicoes
    ADD CONSTRAINT instituicoes_pkey PRIMARY KEY (codigo_instituicao);


--
-- TOC entry 2142 (class 2606 OID 17126)
-- Name: vagas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vagas
    ADD CONSTRAINT vagas_pkey PRIMARY KEY (idvagas);


--
-- TOC entry 2145 (class 2606 OID 16959)
-- Name: fk_cargos_has_curriculo_cargos1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargos_pretendidos
    ADD CONSTRAINT fk_cargos_has_curriculo_cargos1 FOREIGN KEY (codigo_cargo) REFERENCES cargos(codigo_cargo);


--
-- TOC entry 2146 (class 2606 OID 16964)
-- Name: fk_cargos_has_curriculo_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargos_pretendidos
    ADD CONSTRAINT fk_cargos_has_curriculo_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo(idcurriculo);


--
-- TOC entry 2143 (class 2606 OID 16923)
-- Name: fk_cidades_estado1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidades
    ADD CONSTRAINT fk_cidades_estado1 FOREIGN KEY (codigo_estado) REFERENCES estado(codigo_estado);


--
-- TOC entry 2144 (class 2606 OID 16949)
-- Name: fk_curriculo_cidades1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculo
    ADD CONSTRAINT fk_curriculo_cidades1 FOREIGN KEY (cidade_residencia) REFERENCES cidades(codigo_cidade);


--
-- TOC entry 2147 (class 2606 OID 16981)
-- Name: fk_experiencia_cargos1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY experiencia
    ADD CONSTRAINT fk_experiencia_cargos1 FOREIGN KEY (ultimo_cargo_ocupado) REFERENCES cargos(codigo_cargo);


--
-- TOC entry 2148 (class 2606 OID 16986)
-- Name: fk_experiencia_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY experiencia
    ADD CONSTRAINT fk_experiencia_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo(idcurriculo);


--
-- TOC entry 2149 (class 2606 OID 17008)
-- Name: fk_formacao_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formacao
    ADD CONSTRAINT fk_formacao_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo(idcurriculo);


--
-- TOC entry 2150 (class 2606 OID 17013)
-- Name: fk_formacao_cursos1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formacao
    ADD CONSTRAINT fk_formacao_cursos1 FOREIGN KEY (curso) REFERENCES cursos(codigo_curso);


--
-- TOC entry 2151 (class 2606 OID 17018)
-- Name: fk_formacao_instituicoes1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formacao
    ADD CONSTRAINT fk_formacao_instituicoes1 FOREIGN KEY (codigo_instituicao) REFERENCES instituicoes(codigo_instituicao);


--
-- TOC entry 2153 (class 2606 OID 17127)
-- Name: fk_vagas_cidades1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vagas
    ADD CONSTRAINT fk_vagas_cidades1 FOREIGN KEY (codigo_cidade) REFERENCES cidades(codigo_cidade);


--
-- TOC entry 2154 (class 2606 OID 17132)
-- Name: fk_vagas_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vagas
    ADD CONSTRAINT fk_vagas_curriculo1 FOREIGN KEY (candidato_selecionado) REFERENCES curriculo(idcurriculo);


--
-- TOC entry 2152 (class 2606 OID 17078)
-- Name: fk_vagas_has_curriculo_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidatura
    ADD CONSTRAINT fk_vagas_has_curriculo_curriculo1 FOREIGN KEY (codigo_candidato) REFERENCES curriculo(idcurriculo);


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-07-13 21:43:59 BRT

--
-- PostgreSQL database dump complete
--

