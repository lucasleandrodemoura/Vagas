use db;

CREATE TABLE administradores (
  codigo_usuario SERIAL,
  email varchar(45) NOT NULL UNIQUE,
  senha varchar(45) NOT NULL,
  nome varchar(50) NOT NULL,
  ativo boolean DEFAULT true,
  PRIMARY KEY (codigo_usuario)
) ;


CREATE TABLE cargos (
  codigo_cargo SERIAL,
  descricao varchar(255) NOT NULL,
  PRIMARY KEY (codigo_cargo)
) ;



CREATE TABLE cursos (
  codigo_curso SERIAL,
  nome_curso varchar(255) DEFAULT NULL,
  nivel integer DEFAULT NULL,
  PRIMARY KEY (codigo_curso)
) ;



CREATE TABLE estado (
  codigo_estado SERIAL,
  nome_estado varchar(45) DEFAULT NULL,
  sigla varchar(2) DEFAULT NULL,
  PRIMARY KEY (codigo_estado)
) ;



CREATE TABLE cidades (
  codigo_cidade SERIAL,
  nome_cidade varchar(50) NOT NULL,
  codigo_estado INTEGER NOT NULL,
  PRIMARY KEY (codigo_cidade),
  CONSTRAINT fk_cidades_estado1 FOREIGN KEY (codigo_estado) REFERENCES estado (codigo_estado) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;



CREATE TABLE curriculo (
  idcurriculo SERIAL,
  cidade_residencia INTEGER NOT NULL,
  pretencao_salarial float DEFAULT NULL,
  nome varchar(150) NOT NULL,
  estado_civil integer NOT NULL,
  data_nascimento date NOT NULL,
  cpf varchar(15) DEFAULT NULL,
  endereco varchar(255) DEFAULT NULL,
  bairro varchar(50) DEFAULT NULL,
  telefone varchar(50) DEFAULT NULL,
  celular varchar(50) DEFAULT NULL,
  email varchar(50) DEFAULT NULL,
  senha varchar(50) DEFAULT NULL,
  observacoes varchar(255) DEFAULT NULL,
  pdf varchar(50) DEFAULT NULL,
  foto varchar(50) DEFAULT NULL,
  PRIMARY KEY (idcurriculo),
  CONSTRAINT fk_curriculo_cidades1 FOREIGN KEY (cidade_residencia) REFERENCES cidades (codigo_cidade) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;


CREATE TABLE cargos_pretendidos (
  codigo_cargo INTEGER NOT NULL,
  codigo_curriculo INTEGER NOT NULL,
  PRIMARY KEY (codigo_cargo,codigo_curriculo),
  CONSTRAINT fk_cargos_has_curriculo_cargos1 FOREIGN KEY (codigo_cargo) REFERENCES cargos (codigo_cargo) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_cargos_has_curriculo_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;



CREATE TABLE experiencia (
  codigo_experiencia SERIAL,
  nome_empresa varchar(255) NOT NULL,
  atividades_desempenhadas varchar(255) DEFAULT NULL,
  ultimo_cargo_ocupado INTEGER NOT NULL,
  data_de date NOT NULL,
  data_ate date DEFAULT NULL,
  codigo_curriculo INTEGER NOT NULL,
  PRIMARY KEY (codigo_experiencia),
  CONSTRAINT fk_experiencia_cargos1 FOREIGN KEY (ultimo_cargo_ocupado) REFERENCES cargos (codigo_cargo) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_experiencia_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;



CREATE TABLE instituicoes (
  codigo_instituicao SERIAL,
  nome varchar(255) NOT NULL,
  PRIMARY KEY (codigo_instituicao)
) ;


CREATE TABLE formacao (
  codigo_formacao SERIAL,
  curso INTEGER NOT NULL,
  outros varchar(255) DEFAULT NULL,
  concluido boolean DEFAULT NULL,
  inicio date NOT NULL,
  fim date DEFAULT NULL,
  codigo_instituicao INTEGER NOT NULL,
  codigo_curriculo INTEGER NOT NULL,
  PRIMARY KEY (codigo_formacao),
  
  CONSTRAINT fk_formacao_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_formacao_cursos1 FOREIGN KEY (curso) REFERENCES cursos (codigo_curso) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_formacao_instituicoes1 FOREIGN KEY (codigo_instituicao) REFERENCES instituicoes (codigo_instituicao) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;



CREATE TABLE vagas (
  idvagas serial,
  aberto_ate date NOT NULL,
  descricao varchar(255) NOT NULL,
  requisitos varchar(255) NOT NULL,
  codigo_cidade INTEGER NOT NULL,
  salario float NOT NULL,
  titulo varchar(50) NOT NULL,
  cadastrado_por INTEGER NOT NULL,
  candidato_selecionado INTEGER DEFAULT NULL,
  PRIMARY KEY (idvagas),
  
  CONSTRAINT fk_vagas_administradores1 FOREIGN KEY (cadastrado_por) REFERENCES administradores (codigo_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_vagas_cidades1 FOREIGN KEY (codigo_cidade) REFERENCES cidades (codigo_cidade) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_vagas_curriculo1 FOREIGN KEY (candidato_selecionado) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;



CREATE TABLE processo_seletivo (
  codigo_vaga SERIAL,
  parecer varchar(45) DEFAULT NULL,
  recrutador INTEGER NOT NULL,
  PRIMARY KEY (codigo_vaga,candidato_selecionado),
  CONSTRAINT fk_processo_seletivo_administradores1 FOREIGN KEY (recrutador) REFERENCES administradores (codigo_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_vagas_has_curriculo_curriculo2 FOREIGN KEY (candidato_selecionado) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_vagas_has_curriculo_vagas2 FOREIGN KEY (codigo_vaga) REFERENCES vagas (idvagas) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;



CREATE TABLE candidatura (
  codigo_vaga SERIAL,
  codigo_candidato INTEGER NOT NULL,
  PRIMARY KEY (codigo_vaga,codigo_candidato),
  CONSTRAINT fk_vagas_has_curriculo_curriculo1 FOREIGN KEY (codigo_candidato) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_vagas_has_curriculo_vagas1 FOREIGN KEY (codigo_vaga) REFERENCES vagas (idvagas) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;