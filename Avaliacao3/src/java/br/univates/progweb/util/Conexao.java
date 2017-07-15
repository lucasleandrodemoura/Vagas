package br.univates.progweb.util;


import java.sql.Statement;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lucas
 */
public class Conexao {
    private Connection conn;
    private Statement st;
    private String host = "localhost";
    private String port = "5432";
    private String base = "vagas";
    private String user = "postgres";
    private String senha = "postgres";
    
    public Conexao() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://"+host+":"+port+"/"+base, user, senha);
            st = conn.createStatement();
            //this.criarBanco();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public ResultSet selecionar(String sql) throws SQLException{
          ResultSet rs = st.executeQuery(sql);
          
          return rs;
    }
     
    private void criarBanco(){
        String sql = "CREATE TABLE administradores (\n" +
"    codigo_usuario integer NOT NULL,\n" +
"    email character varying(45) NOT NULL,\n" +
"    senha character varying(45) NOT NULL,\n" +
"    nome character varying(50) NOT NULL,\n" +
"    ativo boolean DEFAULT true\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE administradores OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: administradores_codigo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE administradores_codigo_usuario_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE administradores_codigo_usuario_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: administradores_codigo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE administradores_codigo_usuario_seq OWNED BY administradores.codigo_usuario;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: candidatura; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE candidatura (\n" +
"    codigo_vaga integer NOT NULL,\n" +
"    codigo_candidato integer NOT NULL,\n" +
"    parecer character varying(255)\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE candidatura OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: candidatura_codigo_vaga_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE candidatura_codigo_vaga_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE candidatura_codigo_vaga_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: candidatura_codigo_vaga_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE candidatura_codigo_vaga_seq OWNED BY candidatura.codigo_vaga;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cargos; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE cargos (\n" +
"    codigo_cargo integer NOT NULL,\n" +
"    descricao character varying(255) NOT NULL\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE cargos OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: cargos_codigo_cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE cargos_codigo_cargo_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE cargos_codigo_cargo_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: cargos_codigo_cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE cargos_codigo_cargo_seq OWNED BY cargos.codigo_cargo;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cargos_pretendidos; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE cargos_pretendidos (\n" +
"    codigo_cargo integer NOT NULL,\n" +
"    codigo_curriculo integer NOT NULL\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE cargos_pretendidos OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: cidades; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE cidades (\n" +
"    codigo_cidade integer NOT NULL,\n" +
"    nome_cidade character varying(50) NOT NULL,\n" +
"    codigo_estado integer NOT NULL\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE cidades OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: cidades_codigo_cidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE cidades_codigo_cidade_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE cidades_codigo_cidade_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: cidades_codigo_cidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE cidades_codigo_cidade_seq OWNED BY cidades.codigo_cidade;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: curriculo; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE curriculo (\n" +
"    idcurriculo integer NOT NULL,\n" +
"    cidade_residencia integer NOT NULL,\n" +
"    pretencao_salarial double precision,\n" +
"    nome character varying(150) NOT NULL,\n" +
"    estado_civil integer NOT NULL,\n" +
"    data_nascimento date NOT NULL,\n" +
"    cpf character varying(15) DEFAULT NULL::character varying,\n" +
"    endereco character varying(255) DEFAULT NULL::character varying,\n" +
"    bairro character varying(50) DEFAULT NULL::character varying,\n" +
"    telefone character varying(50) DEFAULT NULL::character varying,\n" +
"    celular character varying(50) DEFAULT NULL::character varying,\n" +
"    email character varying(50) DEFAULT NULL::character varying,\n" +
"    senha character varying(50) DEFAULT NULL::character varying,\n" +
"    observacoes character varying(255) DEFAULT NULL::character varying,\n" +
"    pdf character varying(50) DEFAULT NULL::character varying,\n" +
"    foto character varying(50) DEFAULT NULL::character varying\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE curriculo OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: curriculo_idcurriculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE curriculo_idcurriculo_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE curriculo_idcurriculo_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: curriculo_idcurriculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE curriculo_idcurriculo_seq OWNED BY curriculo.idcurriculo;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE cursos (\n" +
"    codigo_curso integer NOT NULL,\n" +
"    nome_curso character varying(255) DEFAULT NULL::character varying,\n" +
"    nivel integer\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE cursos OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: cursos_codigo_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE cursos_codigo_curso_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE cursos_codigo_curso_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: cursos_codigo_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE cursos_codigo_curso_seq OWNED BY cursos.codigo_curso;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: estado; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE estado (\n" +
"    codigo_estado integer NOT NULL,\n" +
"    nome_estado character varying(45) DEFAULT NULL::character varying,\n" +
"    sigla character varying(2) DEFAULT NULL::character varying\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE estado OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: estado_codigo_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE estado_codigo_estado_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE estado_codigo_estado_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: estado_codigo_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE estado_codigo_estado_seq OWNED BY estado.codigo_estado;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: experiencia; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE experiencia (\n" +
"    codigo_experiencia integer NOT NULL,\n" +
"    nome_empresa character varying(255) NOT NULL,\n" +
"    atividades_desempenhadas character varying(255) DEFAULT NULL::character varying,\n" +
"    ultimo_cargo_ocupado integer NOT NULL,\n" +
"    data_de date NOT NULL,\n" +
"    data_ate date,\n" +
"    codigo_curriculo integer NOT NULL\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE experiencia OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: experiencia_codigo_experiencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE experiencia_codigo_experiencia_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE experiencia_codigo_experiencia_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: experiencia_codigo_experiencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE experiencia_codigo_experiencia_seq OWNED BY experiencia.codigo_experiencia;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: formacao; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE formacao (\n" +
"    codigo_formacao integer NOT NULL,\n" +
"    curso integer NOT NULL,\n" +
"    outros character varying(255) DEFAULT NULL::character varying,\n" +
"    concluido boolean,\n" +
"    inicio date NOT NULL,\n" +
"    fim date,\n" +
"    codigo_instituicao integer NOT NULL,\n" +
"    codigo_curriculo integer NOT NULL\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE formacao OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: formacao_codigo_formacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE formacao_codigo_formacao_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE formacao_codigo_formacao_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: formacao_codigo_formacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE formacao_codigo_formacao_seq OWNED BY formacao.codigo_formacao;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: instituicoes; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE instituicoes (\n" +
"    codigo_instituicao integer NOT NULL,\n" +
"    nome character varying(255) NOT NULL\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE instituicoes OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: instituicoes_codigo_instituicao_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE instituicoes_codigo_instituicao_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE instituicoes_codigo_instituicao_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: instituicoes_codigo_instituicao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE instituicoes_codigo_instituicao_seq OWNED BY instituicoes.codigo_instituicao;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: vagas; Type: TABLE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE TABLE vagas (\n" +
"    idvagas integer NOT NULL,\n" +
"    aberto_ate date NOT NULL,\n" +
"    descricao character varying(255) NOT NULL,\n" +
"    requisitos character varying(255) NOT NULL,\n" +
"    codigo_cidade integer NOT NULL,\n" +
"    salario double precision NOT NULL,\n" +
"    titulo character varying(50) NOT NULL,\n" +
"    candidato_selecionado integer,\n" +
"    suspender boolean DEFAULT false\n" +
");\n" +
"\n" +
"\n" +
"ALTER TABLE vagas OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: vagas_idvagas_seq; Type: SEQUENCE; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"CREATE SEQUENCE vagas_idvagas_seq\n" +
"    START WITH 1\n" +
"    INCREMENT BY 1\n" +
"    NO MINVALUE\n" +
"    NO MAXVALUE\n" +
"    CACHE 1;\n" +
"\n" +
"\n" +
"ALTER TABLE vagas_idvagas_seq OWNER TO postgres;\n" +
"\n" +
"--\n" +
"-- Name: vagas_idvagas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER SEQUENCE vagas_idvagas_seq OWNED BY vagas.idvagas;\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_usuario; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY administradores ALTER COLUMN codigo_usuario SET DEFAULT nextval('administradores_codigo_usuario_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_vaga; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY candidatura ALTER COLUMN codigo_vaga SET DEFAULT nextval('candidatura_codigo_vaga_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_cargo; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cargos ALTER COLUMN codigo_cargo SET DEFAULT nextval('cargos_codigo_cargo_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_cidade; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cidades ALTER COLUMN codigo_cidade SET DEFAULT nextval('cidades_codigo_cidade_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: idcurriculo; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY curriculo ALTER COLUMN idcurriculo SET DEFAULT nextval('curriculo_idcurriculo_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_curso; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cursos ALTER COLUMN codigo_curso SET DEFAULT nextval('cursos_codigo_curso_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_estado; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY estado ALTER COLUMN codigo_estado SET DEFAULT nextval('estado_codigo_estado_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_experiencia; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY experiencia ALTER COLUMN codigo_experiencia SET DEFAULT nextval('experiencia_codigo_experiencia_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_formacao; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY formacao ALTER COLUMN codigo_formacao SET DEFAULT nextval('formacao_codigo_formacao_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: codigo_instituicao; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY instituicoes ALTER COLUMN codigo_instituicao SET DEFAULT nextval('instituicoes_codigo_instituicao_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: idvagas; Type: DEFAULT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY vagas ALTER COLUMN idvagas SET DEFAULT nextval('vagas_idvagas_seq'::regclass);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: administradores; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY administradores (codigo_usuario, email, senha, nome, ativo) FROM stdin;\n" +
"3	lucasleandrodemoura@gmail.com	1234	Lucas Leandro de Moura	t\n" +
"5	cinara@pluma.arq.br	atetae	Cinara	t\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: administradores_codigo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('administradores_codigo_usuario_seq', 6, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: candidatura; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY candidatura (codigo_vaga, codigo_candidato, parecer) FROM stdin;\n" +
"1	4	\\N\n" +
"3	4	Seja bem vindo, voce esta contratado!\n" +
"5	4	infelismente você não estara contratado.\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: candidatura_codigo_vaga_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('candidatura_codigo_vaga_seq', 1, false);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY cargos (codigo_cargo, descricao) FROM stdin;\n" +
"1	Programador\n" +
"2	Técnico em informática\n" +
"9	Analista de Sistema\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cargos_codigo_cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('cargos_codigo_cargo_seq', 10, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: cargos_pretendidos; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY cargos_pretendidos (codigo_cargo, codigo_curriculo) FROM stdin;\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: cidades; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY cidades (codigo_cidade, nome_cidade, codigo_estado) FROM stdin;\n" +
"1	Estrela	1\n" +
"4	Lajeado	1\n" +
"6	Teutônia	1\n" +
"7	Arroio do Meio	1\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cidades_codigo_cidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('cidades_codigo_cidade_seq', 7, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: curriculo; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY curriculo (idcurriculo, cidade_residencia, pretencao_salarial, nome, estado_civil, data_nascimento, cpf, endereco, bairro, telefone, celular, email, senha, observacoes, pdf, foto) FROM stdin;\n" +
"6	1	\\N	lakalka	0	2017-07-26	11111111	rkjaarkljaklrjkl	1234	5191617124	5191617124	sgsd@gmail.com	1	\\N	\\N	\\N\n" +
"4	1	2000	Lucas Leandro de Moura	1	1989-12-29	000000	RUA CRUZEIRO DO SUL	Industrias	5191617124	5191617124	lucasleandrodemoura@gmail.com	1234	null	\\N	Formatura Técnico em Informática 2012 (28).JPG\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: curriculo_idcurriculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('curriculo_idcurriculo_seq', 6, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY cursos (codigo_curso, nome_curso, nivel) FROM stdin;\n" +
"5	Técnico em Informática	2\n" +
"6	Computação Aplicada	4\n" +
"4	Análise e Desenvolvimento de Sistemas	3\n" +
"7	Arquitetura e Urbanismo	3\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cursos_codigo_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('cursos_codigo_curso_seq', 7, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY estado (codigo_estado, nome_estado, sigla) FROM stdin;\n" +
"1	Rio Grande do Sul	RS\n" +
"4	Distrito Federal	DF\n" +
"6	Santa Catarina	SC\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: estado_codigo_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('estado_codigo_estado_seq', 6, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: experiencia; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY experiencia (codigo_experiencia, nome_empresa, atividades_desempenhadas, ultimo_cargo_ocupado, data_de, data_ate, codigo_curriculo) FROM stdin;\n" +
"2	Conpasul Construções e Serviços Ltda	Programador PHP	1	2011-03-01	2017-07-13	4\n" +
"3	Governo do RS	Professor de curso técnico	2	2013-08-13	2017-07-13	4\n" +
"6	Adevale	lkçlaekçlaçlafkçlsfklçsakçlafs\\r\\n	2	2017-03-01	2017-09-01	4\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: experiencia_codigo_experiencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('experiencia_codigo_experiencia_seq', 6, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: formacao; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY formacao (codigo_formacao, curso, outros, concluido, inicio, fim, codigo_instituicao, codigo_curriculo) FROM stdin;\n" +
"1	4		t	2017-07-01	2017-07-19	3	4\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: formacao_codigo_formacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('formacao_codigo_formacao_seq', 1, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: instituicoes; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY instituicoes (codigo_instituicao, nome) FROM stdin;\n" +
"2	Univates\n" +
"3	EEEPE\n" +
"6	Unisc\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: instituicoes_codigo_instituicao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('instituicoes_codigo_instituicao_seq', 6, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Data for Name: vagas; Type: TABLE DATA; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"COPY vagas (idvagas, aberto_ate, descricao, requisitos, codigo_cidade, salario, titulo, candidato_selecionado, suspender) FROM stdin;\n" +
"1	1969-01-01	eatlkaetlçkaeçlt\\r\\naeteatçkaeçlkae\\r\\naetkjaeçlea\\r\\naetçkjaetçlkae	taetaetaeeattae\\r\\nte\\r\\naet\\r\\naetçkaeçlkeatlçkaetçl\\r\\n\\r\\n\\r\\naetlaekçlaektlçaet\\r\\naetçkaeçlkaeçlkçl	1	2222	taeeateateat	\\N	f\n" +
"2	1969-01-01	aetaetaeteateattae	taetaetae	1	11111	taeaetaetaet	\\N	f\n" +
"3	1969-01-01	Irá trabalhar em um projeto bancário, realizando codificação conforme demandas apontadas pelos analistas.	Deve ter boa lógica de programação, conhecimento em Java	1	2000	Desenvolvedor	4	f\n" +
"4	2018-01-01	Urgente	Deverá atuar na fiscalização de receitas	6	4500	Farmacêutico Sênior	\\N	f\n" +
"5	2017-09-20	aeteta	ettae	4	1000	Técnico em Informática	\\N	f\n" +
"\\.\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: vagas_idvagas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"SELECT pg_catalog.setval('vagas_idvagas_seq', 5, true);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: administradores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY administradores\n" +
"    ADD CONSTRAINT administradores_email_key UNIQUE (email);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: administradores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY administradores\n" +
"    ADD CONSTRAINT administradores_pkey PRIMARY KEY (codigo_usuario);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: candidatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY candidatura\n" +
"    ADD CONSTRAINT candidatura_pkey PRIMARY KEY (codigo_vaga, codigo_candidato);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cargos\n" +
"    ADD CONSTRAINT cargos_pkey PRIMARY KEY (codigo_cargo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cargos_pretendidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cargos_pretendidos\n" +
"    ADD CONSTRAINT cargos_pretendidos_pkey PRIMARY KEY (codigo_cargo, codigo_curriculo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cidades\n" +
"    ADD CONSTRAINT cidades_pkey PRIMARY KEY (codigo_cidade);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: curriculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY curriculo\n" +
"    ADD CONSTRAINT curriculo_pkey PRIMARY KEY (idcurriculo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cursos\n" +
"    ADD CONSTRAINT cursos_pkey PRIMARY KEY (codigo_curso);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY estado\n" +
"    ADD CONSTRAINT estado_pkey PRIMARY KEY (codigo_estado);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: experiencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY experiencia\n" +
"    ADD CONSTRAINT experiencia_pkey PRIMARY KEY (codigo_experiencia);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: formacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY formacao\n" +
"    ADD CONSTRAINT formacao_pkey PRIMARY KEY (codigo_formacao);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: instituicoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY instituicoes\n" +
"    ADD CONSTRAINT instituicoes_pkey PRIMARY KEY (codigo_instituicao);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: vagas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY vagas\n" +
"    ADD CONSTRAINT vagas_pkey PRIMARY KEY (idvagas);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_cargos_has_curriculo_cargos1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cargos_pretendidos\n" +
"    ADD CONSTRAINT fk_cargos_has_curriculo_cargos1 FOREIGN KEY (codigo_cargo) REFERENCES cargos(codigo_cargo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_cargos_has_curriculo_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cargos_pretendidos\n" +
"    ADD CONSTRAINT fk_cargos_has_curriculo_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo(idcurriculo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_cidades_estado1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY cidades\n" +
"    ADD CONSTRAINT fk_cidades_estado1 FOREIGN KEY (codigo_estado) REFERENCES estado(codigo_estado);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_curriculo_cidades1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY curriculo\n" +
"    ADD CONSTRAINT fk_curriculo_cidades1 FOREIGN KEY (cidade_residencia) REFERENCES cidades(codigo_cidade);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_experiencia_cargos1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY experiencia\n" +
"    ADD CONSTRAINT fk_experiencia_cargos1 FOREIGN KEY (ultimo_cargo_ocupado) REFERENCES cargos(codigo_cargo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_experiencia_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY experiencia\n" +
"    ADD CONSTRAINT fk_experiencia_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo(idcurriculo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_formacao_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY formacao\n" +
"    ADD CONSTRAINT fk_formacao_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo(idcurriculo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_formacao_cursos1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY formacao\n" +
"    ADD CONSTRAINT fk_formacao_cursos1 FOREIGN KEY (curso) REFERENCES cursos(codigo_curso);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_formacao_instituicoes1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY formacao\n" +
"    ADD CONSTRAINT fk_formacao_instituicoes1 FOREIGN KEY (codigo_instituicao) REFERENCES instituicoes(codigo_instituicao);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_vagas_cidades1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY vagas\n" +
"    ADD CONSTRAINT fk_vagas_cidades1 FOREIGN KEY (codigo_cidade) REFERENCES cidades(codigo_cidade);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_vagas_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY vagas\n" +
"    ADD CONSTRAINT fk_vagas_curriculo1 FOREIGN KEY (candidato_selecionado) REFERENCES curriculo(idcurriculo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: fk_vagas_has_curriculo_curriculo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres\n" +
"--\n" +
"\n" +
"ALTER TABLE ONLY candidatura\n" +
"    ADD CONSTRAINT fk_vagas_has_curriculo_curriculo1 FOREIGN KEY (codigo_candidato) REFERENCES curriculo(idcurriculo);\n" +
"\n" +
"\n" +
"--\n" +
"-- Name: public; Type: ACL; Schema: -; Owner: postgres\n" +
"--\n" +
"\n" +
"REVOKE ALL ON SCHEMA public FROM PUBLIC;\n" +
"REVOKE ALL ON SCHEMA public FROM postgres;\n" +
"GRANT ALL ON SCHEMA public TO postgres;\n" +
"GRANT ALL ON SCHEMA public TO PUBLIC;\n" +
"\n" +
"\n" +
"--\n" +
"-- PostgreSQL database dump complete\n" +
"--";

        boolean retorno = this.incluir(sql);
    }
    
    public void fechar(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean incluir(String sql){
        int i = 0;
        try {
            i = st.executeUpdate(sql);
            // Verificar se o insert foi bem sucedido
            if (i > 0) {
                return true;
            } else {
                return false;
            }
            
            
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    
    }
    
    
}
