<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="br.univates.progweb.Cargos"%>
<%@page import="br.univates.progweb.Experiencia"%>
<%@page import="br.univates.progweb.Estado"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
   <div class="conteudo">
                <div class="row">
                    
                    <div class="col-sm-12 col-md-4">
                        <div class="thumbnail" id="vaga">
                            <div class="caption">
                                <h3>Técnico em Informática</h3>
                                <p>Curso Técnico em Informática<br>Experiência: 2 anos<br>Salário: R$1.200,00<br>Cidade: Lajeado/RS</p>
                                <a href="admin_cadastrar_vaga.jsp" class="btn btn-default small" role="button" id="Link_Candidatar1">Editar</a>
                                <a href="admin_ver_candidatos.jsp" class="btn btn-default small" role="button" id="Link_Candidatar2">Ver candidatos</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-4">
                        <div class="thumbnail" id="vaga">
                            <div class="caption">
                                <h3>Farmacêutica</h3>
                                <p>Curso Superior em Farmácia<br>Registro no CRF<br>Salário: R$4.800,00<br>Cidade: Lajeado/RS</p>
                                <a href="#" class="btn btn-default small" role="button" id="Link_Candidatar2">Editar</a>
                                <a href="#" class="btn btn-default small" role="button" id="Link_Candidatar2">Ver candidatos</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-4">
                        <div class="thumbnail" id="vaga">
                            <div class="caption">
                                <h3>Programador WEB</h3>
                                <p>Ensino Superior em Andamento
                                    <br>Conhecimento: PHP, Banco de dados SQL
                                    <br>Salário: R$2.000,00<br>Cidade: Lajeado/RS</p>
                                <a href="#" class="btn btn-default small" role="button" id="Link_Candidatar2">Editar</a>
                                <a href="#" class="btn btn-default small" role="button" id="Link_Candidatar2">Ver candidatos</a>
                            </div>
                        </div>
                    </div>

                </div>
                
                <div class="row">

                    <div class="col-sm-12 col-md-4">
                        <div class="thumbnail" id="vaga">
                            <div class="caption">
                                <h3>Frentista</h3>
                                <p>Maior de 18 anos<br>Disponibilidade de horário<br>Salário: R$1.300,00<br>Cidade: Lajeado/RS</p>
                                <a href="#" class="btn btn-default small" role="button" id="Link_Candidatar2">Editar</a>
                                <a href="#" class="btn btn-default small" role="button" id="Link_Candidatar2">Ver candidatos</a>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="col-sm-12 col-md-4">
                        <div class="thumbnail" id="vaga">
                            <a href="admin_cadastrar_vaga.jsp"><h1><i class="glyphicon glyphicon glyphicon-plus-sign"></i> Adicionar vaga</h1></a>
                        </div>
                    </div>

                </div>  

              </div>
        
    <%@ include file="includes/footer.jsp" %>
        
       