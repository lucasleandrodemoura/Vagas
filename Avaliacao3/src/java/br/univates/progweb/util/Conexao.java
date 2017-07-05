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
    private String senha = "1234";
    
    public Conexao() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://"+host+":"+port+"/"+base, user, senha);
            st = conn.createStatement();
            this.criarBanco();
            
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
"  codigo_usuario SERIAL,\n" +
"  email varchar(45) NOT NULL UNIQUE,\n" +
"  senha varchar(45) NOT NULL,\n" +
"  nome varchar(50) NOT NULL,\n" +
"  ativo boolean DEFAULT true,\n" +
"  PRIMARY KEY (codigo_usuario)\n" +
") ;\n" +
"\n" +
"\n" +
"CREATE TABLE cargos (\n" +
"  codigo_cargo SERIAL,\n" +
"  descricao varchar(255) NOT NULL,\n" +
"  PRIMARY KEY (codigo_cargo)\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE cursos (\n" +
"  codigo_curso SERIAL,\n" +
"  nome_curso varchar(255) DEFAULT NULL,\n" +
"  nivel integer DEFAULT NULL,\n" +
"  PRIMARY KEY (codigo_curso)\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE estado (\n" +
"  codigo_estado SERIAL,\n" +
"  nome_estado varchar(45) DEFAULT NULL,\n" +
"  sigla varchar(2) DEFAULT NULL,\n" +
"  PRIMARY KEY (codigo_estado)\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE cidades (\n" +
"  codigo_cidade SERIAL,\n" +
"  nome_cidade varchar(50) NOT NULL,\n" +
"  codigo_estado INTEGER NOT NULL,\n" +
"  PRIMARY KEY (codigo_cidade),\n" +
"  CONSTRAINT fk_cidades_estado1 FOREIGN KEY (codigo_estado) REFERENCES estado (codigo_estado) ON DELETE NO ACTION ON UPDATE NO ACTION\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE curriculo (\n" +
"  idcurriculo SERIAL,\n" +
"  cidade_residencia INTEGER NOT NULL,\n" +
"  pretencao_salarial float DEFAULT NULL,\n" +
"  nome varchar(150) NOT NULL,\n" +
"  estado_civil integer NOT NULL,\n" +
"  data_nascimento date NOT NULL,\n" +
"  cpf varchar(15) DEFAULT NULL,\n" +
"  endereco varchar(255) DEFAULT NULL,\n" +
"  bairro varchar(50) DEFAULT NULL,\n" +
"  telefone varchar(50) DEFAULT NULL,\n" +
"  celular varchar(50) DEFAULT NULL,\n" +
"  email varchar(50) DEFAULT NULL,\n" +
"  senha varchar(50) DEFAULT NULL,\n" +
"  observacoes varchar(255) DEFAULT NULL,\n" +
"  pdf varchar(50) DEFAULT NULL,\n" +
"  foto varchar(50) DEFAULT NULL,\n" +
"  PRIMARY KEY (idcurriculo),\n" +
"  CONSTRAINT fk_curriculo_cidades1 FOREIGN KEY (cidade_residencia) REFERENCES cidades (codigo_cidade) ON DELETE NO ACTION ON UPDATE NO ACTION\n" +
") ;\n" +
"\n" +
"\n" +
"CREATE TABLE cargos_pretendidos (\n" +
"  codigo_cargo INTEGER NOT NULL,\n" +
"  codigo_curriculo INTEGER NOT NULL,\n" +
"  PRIMARY KEY (codigo_cargo,codigo_curriculo),\n" +
"  CONSTRAINT fk_cargos_has_curriculo_cargos1 FOREIGN KEY (codigo_cargo) REFERENCES cargos (codigo_cargo) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_cargos_has_curriculo_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE experiencia (\n" +
"  codigo_experiencia SERIAL,\n" +
"  nome_empresa varchar(255) NOT NULL,\n" +
"  atividades_desempenhadas varchar(255) DEFAULT NULL,\n" +
"  ultimo_cargo_ocupado INTEGER NOT NULL,\n" +
"  data_de date NOT NULL,\n" +
"  data_ate date DEFAULT NULL,\n" +
"  codigo_curriculo INTEGER NOT NULL,\n" +
"  PRIMARY KEY (codigo_experiencia),\n" +
"  CONSTRAINT fk_experiencia_cargos1 FOREIGN KEY (ultimo_cargo_ocupado) REFERENCES cargos (codigo_cargo) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_experiencia_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE instituicoes (\n" +
"  codigo_instituicao SERIAL,\n" +
"  nome varchar(255) NOT NULL,\n" +
"  PRIMARY KEY (codigo_instituicao)\n" +
") ;\n" +
"\n" +
"\n" +
"CREATE TABLE formacao (\n" +
"  codigo_formacao SERIAL,\n" +
"  curso INTEGER NOT NULL,\n" +
"  outros varchar(255) DEFAULT NULL,\n" +
"  concluido boolean DEFAULT NULL,\n" +
"  inicio date NOT NULL,\n" +
"  fim date DEFAULT NULL,\n" +
"  codigo_instituicao INTEGER NOT NULL,\n" +
"  codigo_curriculo INTEGER NOT NULL,\n" +
"  PRIMARY KEY (codigo_formacao),\n" +
"  \n" +
"  CONSTRAINT fk_formacao_curriculo1 FOREIGN KEY (codigo_curriculo) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_formacao_cursos1 FOREIGN KEY (curso) REFERENCES cursos (codigo_curso) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_formacao_instituicoes1 FOREIGN KEY (codigo_instituicao) REFERENCES instituicoes (codigo_instituicao) ON DELETE NO ACTION ON UPDATE NO ACTION\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE vagas (\n" +
"  idvagas serial,\n" +
"  aberto_ate date NOT NULL,\n" +
"  descricao varchar(255) NOT NULL,\n" +
"  requisitos varchar(255) NOT NULL,\n" +
"  codigo_cidade INTEGER NOT NULL,\n" +
"  salario float NOT NULL,\n" +
"  titulo varchar(50) NOT NULL,\n" +
"  cadastrado_por INTEGER NOT NULL,\n" +
"  candidato_selecionado INTEGER DEFAULT NULL,\n" +
"  PRIMARY KEY (idvagas),\n" +
"  \n" +
"  CONSTRAINT fk_vagas_administradores1 FOREIGN KEY (cadastrado_por) REFERENCES administradores (codigo_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_vagas_cidades1 FOREIGN KEY (codigo_cidade) REFERENCES cidades (codigo_cidade) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_vagas_curriculo1 FOREIGN KEY (candidato_selecionado) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE processo_seletivo (\n" +
"  codigo_vaga INTEGER NOT NULL,\n" +
"  candidato_selecionado INTEGER NOT NULL,\n" +
"  parecer varchar(45) DEFAULT NULL,\n" +
"  recrutador INTEGER NOT NULL,\n" +
"  PRIMARY KEY (codigo_vaga,candidato_selecionado),\n" +
"  CONSTRAINT fk_processo_seletivo_administradores1 FOREIGN KEY (recrutador) REFERENCES administradores (codigo_usuario) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_vagas_has_curriculo_curriculo2 FOREIGN KEY (candidato_selecionado) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_vagas_has_curriculo_vagas2 FOREIGN KEY (codigo_vaga) REFERENCES vagas (idvagas) ON DELETE NO ACTION ON UPDATE NO ACTION\n" +
") ;\n" +
"\n" +
"\n" +
"\n" +
"CREATE TABLE candidatura (\n" +
"  codigo_vaga SERIAL,\n" +
"  codigo_candidato INTEGER NOT NULL,\n" +
"  PRIMARY KEY (codigo_vaga,codigo_candidato),\n" +
"  CONSTRAINT fk_vagas_has_curriculo_curriculo1 FOREIGN KEY (codigo_candidato) REFERENCES curriculo (idcurriculo) ON DELETE NO ACTION ON UPDATE NO ACTION,\n" +
"  CONSTRAINT fk_vagas_has_curriculo_vagas1 FOREIGN KEY (codigo_vaga) REFERENCES vagas (idvagas) ON DELETE NO ACTION ON UPDATE NO ACTION\n" +
") ;";

        this.incluir(sql);
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
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    
    }
    
    
}
