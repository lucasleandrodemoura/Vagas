package br.univates.progweb.models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import br.univates.progweb.util.Conexao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lucasmoura
 */
public class Curriculo {

  
    private Integer idcurriculo;
    
    private double pretencaoSalarial;
    
    private String nome;
    
    private int estadoCivil;
    
    private Date dataNascimento;
    
    private String cpf;
    
    private String endereco;
    
    private String bairro;
    
    private String telefone;
    
    private String celular;
    
    private String email;
    
    private String senha;
    
    private String observacoes;
    
    private String pdf;
    
    private String foto;
    
    private int cidade_residencia;
    

    public Curriculo() {
    }

  

    
    public Curriculo(Integer idcurriculo) {
        try {
            Conexao conexao = new Conexao();
            ResultSet selecionar = conexao.selecionar("select *  from curriculo where idcurriculo = 4");
            
            
            while(selecionar.next()){
                
                
                this.setBairro(selecionar.getString("bairro"));
                this.setCelular(selecionar.getString("celular"));
                this.setTelefone(selecionar.getString("telefone"));
                this.setCidade_residencia(selecionar.getInt("cidade_residencia"));
                this.setCpf(selecionar.getString("cpf"));
                this.setEmail(selecionar.getString("email"));
                this.setDataNascimento(selecionar.getDate("data_nascimento"));
                this.setEndereco(selecionar.getString("endereco"));
                this.setEstadoCivil(selecionar.getInt("estado_civil"));
                this.setFoto(selecionar.getString("foto"));
                this.setIdcurriculo(selecionar.getInt("idcurriculo"));
                this.setNome(selecionar.getString("nome"));
                this.setObservacoes(selecionar.getString("observacoes"));
                this.setPretencaoSalarial(selecionar.getDouble("pretencao_salarial"));
                this.setSenha(selecionar.getString("senha"));
                
                
                
                
                
            }
            conexao.fechar();
        } catch (SQLException ex) {
            Logger.getLogger(Curriculo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
      public int getCidade_residencia() {
        return cidade_residencia;
    }

    public void setCidade_residencia(int cidade_residencia) {
        
        System.out.println(cidade_residencia);
        this.cidade_residencia = cidade_residencia;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    

    public Integer getIdcurriculo() {
        return idcurriculo;
    }

    public void setIdcurriculo(Integer idcurriculo) {
        this.idcurriculo = idcurriculo;
    }

    public double getPretencaoSalarial() {
        return pretencaoSalarial;
    }

    public void setPretencaoSalarial(double pretencaoSalarial) {
        this.pretencaoSalarial = pretencaoSalarial;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(int estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
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

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public String getPdf() {
        return pdf;
    }

    public void setPdf(String pdf) {
        this.pdf = pdf;
    }
    
    
    public void gravar(){
        Conexao conexao;
        String SQL = "";
        
        
        
        
        
        
        //Edição
        if(this.getIdcurriculo()==null){
            
        }else{
            SQL = "INSERT INTO curriculo(" +
"                        pretencao_salarial,"
                    + "nome, "
                    + "estado_civil, "
                    + "cpf,endereco, bairro, telefone, celular, email, " +
"                       senha, observacoes, pdf, foto)" +
"                     VALUES ("+this.getPretencaoSalarial()+", "
                    + "'"+this.getNome()+"', "
                    + ""+this.getEstadoCivil()+", "
                    + "'"+this.getCpf()+"',"
                    + "'"+this.getEndereco()+"',"
                    + "'"+this.getBairro()+"',"
                    + "'"+this.getCelular()+"',"
                    + "'"+this.getEmail()+"',"
                    + "'"+this.getSenha()+"',"
                    + "'"+this.getObservacoes()+"',"
                    + "'"+this.getPdf()+"',"
                    + "'"+this.getFoto()+"');";
        }
        
        
        
        try {
            conexao = new Conexao();
            conexao.incluir(SQL);
            conexao.fechar();
        } catch (SQLException ex) {
            Logger.getLogger(Curriculo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public boolean logar(){
        
        boolean retorno = false;
        try {
            Conexao conexao = new Conexao();
            ResultSet selecionar = conexao.selecionar("select *  from curriculo where cpf = '"+this.getCpf()+"' and senha = '"+this.getSenha()+"'");
            
            while(selecionar.next()){
                retorno = true;
                this.setBairro(selecionar.getString("bairro"));
                this.setCelular(selecionar.getString("celular"));
                this.setCpf(selecionar.getString("cpf"));
                this.setEmail(selecionar.getString("email"));
                this.setEndereco(selecionar.getString("endereco"));
                this.setEstadoCivil(Integer.parseInt(selecionar.getString("estado_civil")));
                this.setIdcurriculo(Integer.parseInt(selecionar.getString("idcurriculo")));
                this.setNome(selecionar.getString("nome"));
                this.setObservacoes(selecionar.getString("observacao"));
                this.setPdf(selecionar.getString("pdf"));
                this.setPretencaoSalarial(Float.parseFloat(selecionar.getString("pretencao_salarial")));
                this.setSenha(selecionar.getString("senha"));
                this.setTelefone(selecionar.getString("telefone"));
                
                
            }
            conexao.fechar();
        } catch (SQLException ex) {
            Logger.getLogger(Curriculo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retorno;
        
    }
  
    
    
}
