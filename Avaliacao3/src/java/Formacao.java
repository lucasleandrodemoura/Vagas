/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.Date;

/**
 * Armazena informações refenre a formação de um currículo
 * @author lucasmoura
 */
public class Formacao{

    private Integer codigoFormacao;
    private String outros;
    private Boolean concluido;
    private Date inicio;
    private Date fim;
    private Curriculo codigoCurriculo;
    private Cursos curso;
    private Instituicoes codigoInstituicao;

    public Integer getCodigoFormacao() {
        return codigoFormacao;
    }

    public void setCodigoFormacao(Integer codigoFormacao) {
        this.codigoFormacao = codigoFormacao;
    }

    public String getOutros() {
        return outros;
    }

    public void setOutros(String outros) {
        this.outros = outros;
    }

    public Boolean getConcluido() {
        return concluido;
    }

    public void setConcluido(Boolean concluido) {
        this.concluido = concluido;
    }

    public Date getInicio() {
        return inicio;
    }

    public void setInicio(Date inicio) {
        this.inicio = inicio;
    }

    public Date getFim() {
        return fim;
    }

    public void setFim(Date fim) {
        this.fim = fim;
    }

    public Curriculo getCodigoCurriculo() {
        return codigoCurriculo;
    }

    public void setCodigoCurriculo(Curriculo codigoCurriculo) {
        this.codigoCurriculo = codigoCurriculo;
    }

    public Cursos getCurso() {
        return curso;
    }

    public void setCurso(Cursos curso) {
        this.curso = curso;
    }

    public Instituicoes getCodigoInstituicao() {
        return codigoInstituicao;
    }

    public void setCodigoInstituicao(Instituicoes codigoInstituicao) {
        this.codigoInstituicao = codigoInstituicao;
    }

    
    
}
