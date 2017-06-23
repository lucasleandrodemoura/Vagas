<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
   
        <div class="conteudo">
                <div class="row">
                    <h3>Cadastro de vagas</h3>
                    <form class="form-group" name="cadastrar_basico" method="post" action="admin_logado.jsp">
                        <table id="vaga" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Título:</th>
                                    <td><input class="form-control small" maxlength="50" type="text" required name="titulo"></td>
                                </tr>
                                
                                <tr>
                                    <th>Salário:</th>
                                    <td><input class="form-control small" type="number" step="0.01" required name="salario"></td>
                                </tr>
                                
                                <tr>
                                    <th>Vaga aberta até:</th>
                                    <td><input class="form-control small" type="date" required name="aberto_ate"></td>
                                </tr>
                                
                                <tr>
                                <th>Cidade de trabalho: </th>
                                <td>
                                    
                                    <select class="form-control small" required name="cidade">
                                        <option value=""></option>
                                        <option value="1">Exemplo</option>
                                    </select>
                                </td>
                            </tr>
                                
                                
                                <tr>
                                    <th>Requisitos:</th>
                                    <td><textarea class="form-control small" maxlength="255" required name="requisitos"></textarea></td>
                                </tr>
                                <tr>
                                    <th>Descrição:</th>
                                    <td><textarea class="form-control small" maxlength="255" required name="descricao"></textarea></td>
                                </tr>
                                </thead>    
                                <tfoot>
                                 <tr>
                                     <td colspan="2"><input type="submit" class="btn btn-primary" name="btn_cadastrar" value="Cadastrar"></td>
                                    
                                </tr>
                                
                                </tfoot>

                            
                        </table>
                    </form>

                </div>  

              </div>
    <%@ include file="includes/footer.jsp" %>
        
       