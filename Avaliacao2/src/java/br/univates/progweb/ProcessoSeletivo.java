/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.progweb;


/**
 * Armazena informações referente ao processo seletivo
 * @author lucasmoura
 */
public class ProcessoSeletivo{

    
    private String parecer;
    private Administradores recrutador;
    private Curriculo curriculo;
    private Vagas vagas;

    public String getParecer() {
        return parecer;
    }

    public void setParecer(String parecer) {
        this.parecer = parecer;
    }

    public Administradores getRecrutador() {
        return recrutador;
    }

    public void setRecrutador(Administradores recrutador) {
        this.recrutador = recrutador;
    }

    public Curriculo getCurriculo() {
        return curriculo;
    }

    public void setCurriculo(Curriculo curriculo) {
        this.curriculo = curriculo;
    }

    public Vagas getVagas() {
        return vagas;
    }

    public void setVagas(Vagas vagas) {
        this.vagas = vagas;
    }

    
    
    
}
