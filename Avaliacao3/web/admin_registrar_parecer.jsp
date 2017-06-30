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
                    <h3>Registro de parecer da vaga <b>Técnico em Informática</b> para o candidato <b>Lucas Leandro de Moura</b></h3>
                    <form class="form-group" name="cadastrar_parecer" method="post" action="admin_ver_candidatos.jsp">
                        <table id="vaga" class="table table-bordered table-striped">
                            <thead>
                              
                                <tr>
                                    <th>Parecer:</th>
                                    <td><textarea class="form-control small" maxlength="255" required name="parecer"></textarea></td>
                                </tr>
                                </thead>    
                                <tfoot>
                                 <tr>
                                     <td colspan="2"><input type="submit" class="btn btn-primary" value="Atualizar"></td>
                                    
                                </tr>
                                
                                </tfoot>

                            
                        </table>
                    </form>

                </div>  

              </div>
        
    <%@ include file="includes/footer.jsp" %>
        
       