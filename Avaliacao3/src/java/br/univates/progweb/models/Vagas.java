package br.univates.progweb.models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.Date;


/**
 * Classe que armazena informações das vagas anunciadas
 * @author lucasmoura
 */
public class Vagas{

    private Integer idvagas;
    private Date abertoAte;
    private String descricao;
    private String requisitos;
    private double salario;
    private String titulo;
    private Administradores cadastradoPor;
    private Cidades codigoCidade;
    private Curriculo candidatoSelecionado;


    public Vagas() {
    }

    public Vagas(Integer idvagas) {
        this.idvagas = idvagas;
    }

    public Vagas(Integer idvagas, Date abertoAte, String descricao, String requisitos, float salario, String titulo) {
        this.idvagas = idvagas;
        this.abertoAte = abertoAte;
        this.descricao = descricao;
        this.requisitos = requisitos;
        this.salario = salario;
        this.titulo = titulo;
    }
    
    public String getQuadro(boolean logado){
        if(logado==true){
            return "<div class=\"col-sm-12 col-md-3\">\n" +
"                        <div class=\"thumbnail\" id=\"vaga_"+this.getIdvagas()+"\">\n" +
"                            <div class=\"caption\">\n" +
"                                <h3>"+this.getTitulo()+"</h3>\n" +
"                                <p>"+this.getRequisitos()+"<br>Salário: R$ "+this.getSalario()+"</p>\n" +
"                                <a href=\"javascript:candidatar("+this.getIdvagas()+");\" class=\"btn btn-warning small\" role=\"button\" id=\"Link_Candidatar_"+this.getIdvagas()+"\">Candidatar</a>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                    </div>     ";
        }else{
        return "<div class=\"col-sm-12 col-md-3\">\n" +
"                        <div class=\"thumbnail\" id=\"vaga_"+this.getIdvagas()+"\">\n" +
"                            <div class=\"caption\">\n" +
"                                <h3>"+this.getTitulo()+"</h3>\n" +
"                                <p>"+this.getRequisitos()+"<br>Salário: R$ "+this.getSalario()+"</p>\n" +
"                                <a href=\"editar_vaga.jsp?codigo="+this.getIdvagas()+"\" class=\"btn btn-default small\" role=\"button\" id=\"Link_Candidatar_"+this.getIdvagas()+"\">Saiba mais</a>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                    </div>     ";
        }
    }

    public Integer getIdvagas() {
        return idvagas;
    }

    public void setIdvagas(Integer idvagas) {
        this.idvagas = idvagas;
    }

    public Date getAbertoAte() {
        return abertoAte;
    }

    public void setAbertoAte(Date abertoAte) {
        this.abertoAte = abertoAte;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getRequisitos() {
        return requisitos;
    }

    public void setRequisitos(String requisitos) {
        this.requisitos = requisitos;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

   

    public Administradores getCadastradoPor() {
        return cadastradoPor;
    }

    public void setCadastradoPor(Administradores cadastradoPor) {
        this.cadastradoPor = cadastradoPor;
    }

    public Cidades getCodigoCidade() {
        return codigoCidade;
    }

    public void setCodigoCidade(Cidades codigoCidade) {
        this.codigoCidade = codigoCidade;
    }

    public Curriculo getCandidatoSelecionado() {
        return candidatoSelecionado;
    }

    public void setCandidatoSelecionado(Curriculo candidatoSelecionado) {
        this.candidatoSelecionado = candidatoSelecionado;
    }

}
