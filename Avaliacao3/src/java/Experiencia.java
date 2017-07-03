/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.Date;


/**
 *
 * @author lucasmoura
 */
public class Experiencia{

    private Integer codigoExperiencia;
    private String nomeEmpresa;
    private String atividadesDesempenhadas;
    private Date dataDe;
    private Date dataAte;
    private Cargos ultimoCargoOcupado;
    private Curriculo codigoCurriculo;

    public Integer getCodigoExperiencia() {
        return codigoExperiencia;
    }

    public void setCodigoExperiencia(Integer codigoExperiencia) {
        this.codigoExperiencia = codigoExperiencia;
    }

    public String getNomeEmpresa() {
        return nomeEmpresa;
    }

    public void setNomeEmpresa(String nomeEmpresa) {
        this.nomeEmpresa = nomeEmpresa;
    }

    public String getAtividadesDesempenhadas() {
        return atividadesDesempenhadas;
    }

    public void setAtividadesDesempenhadas(String atividadesDesempenhadas) {
        this.atividadesDesempenhadas = atividadesDesempenhadas;
    }

    public Date getDataDe() {
        return dataDe;
    }

    public void setDataDe(Date dataDe) {
        this.dataDe = dataDe;
    }

    public Date getDataAte() {
        return dataAte;
    }

    public void setDataAte(Date dataAte) {
        this.dataAte = dataAte;
    }

    public Cargos getUltimoCargoOcupado() {
        return ultimoCargoOcupado;
    }

    public void setUltimoCargoOcupado(Cargos ultimoCargoOcupado) {
        this.ultimoCargoOcupado = ultimoCargoOcupado;
    }

    public Curriculo getCodigoCurriculo() {
        return codigoCurriculo;
    }

    public void setCodigoCurriculo(Curriculo codigoCurriculo) {
        this.codigoCurriculo = codigoCurriculo;
    }

}
