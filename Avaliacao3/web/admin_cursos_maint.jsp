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
                    <div class="col-lg-12">
                    <h3>Cursos</h3>
                    <form name="formulario" method="post" action="incluirCurso">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td><input type="text" name="descricao" maxlength="50" required class="form-control"></td>
                            </tr>
                            
                             <tr>
                                <th>Nível</th>
                                <td><select class="form-control" name="nivel" required>
                                        <option value="1">Médio</option>
                                        <option value="2">Técnico</option>
                                        <option value="3">Superior</option>
                                        <option value="4">Pós-Graduação</option>
                                    </select>
                                </td>
                            </tr>
                            
                        </thead>
                        
                            <tr>
                                <td colspan="2">
                                 <input class="btn btn-primary" type="submit" value="Gravar">
                                 
                                </td>
                            </tr>
                        
                    </table>
                    </form>
                    
                    
                    
                    

                </div>  
                    
                </div>

              </div>
    <%@ include file="includes/footer.jsp" %>
        
       