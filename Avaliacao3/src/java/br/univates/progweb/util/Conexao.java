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
        String sql = "CREATE TABLE IF NOT EXISTS produtos (\n" +
"	codigo SERIAL PRIMARY KEY,\n" +
"	nome VARCHAR(255) NOT NULL,\n" +
"	unidade VARCHAR(255) NOT NULL,\n" +
"	preco DECIMAL(10,2) DEFAULT 0.00,\n" +
"	estoque INTEGER DEFAULT 0\n" +
");"
                + "CREATE TABLE IF NOT EXISTS clientes (\n" +
"	codigo SERIAL PRIMARY KEY,\n" +
"	nome VARCHAR(255) not null,\n" +
"	endereco VARCHAR(255) not null,\n" +
"	numero INT,\n" +
"	complemento VARCHAR(255),\n" +
"	bairro VARCHAR(50) NOT NULL,\n" +
"	cidade INT NOT NULL,\n" +
"	cep VARCHAR(11) NOT NULL,\n" +
"	telefone VARCHAR(15),\n" +
"	celular VARCHAR(15)\n" +
");\n" +
"\n" +
"\n" +
"CREATE TABLE IF NOT EXISTS cidades (\n" +
"	codigo SERIAL PRIMARY KEY,\n" +
"	nome VARCHAR(255) not null\n" +
");";

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
