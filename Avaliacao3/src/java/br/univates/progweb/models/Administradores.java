package br.univates.progweb.models;

import br.univates.progweb.util.Conexao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



public class Administradores{
    private Integer codigoUsuario;
    private String email;
    private String senha;
    private String nome;
    private Boolean ativo;

    public Integer getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(Integer codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }
    
    
    public boolean logar(){
        
        boolean retorno = false;
        try {
            Conexao conexao = new Conexao();
            ResultSet selecionar = conexao.selecionar("select *  from administradores where email = '"+this.getEmail()+"' and senha = '"+this.getSenha()+"' and ativo = true");
            
            while(selecionar.next()){
                this.setAtivo(true);
                this.setCodigoUsuario(Integer.parseInt(selecionar.getString("codigo_usuario")));
                this.setEmail(selecionar.getString("email"));
                this.setNome(selecionar.getString("nome"));
                this.setSenha(selecionar.getString("senha"));
                
                retorno = true;
            }
            conexao.fechar();
        } catch (SQLException ex) {
            Logger.getLogger(Curriculo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retorno;
        
    }
    
    
    
   
    
}
