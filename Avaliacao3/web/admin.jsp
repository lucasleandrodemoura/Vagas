<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
   
    <b><h3>Login da Área administrativa</h3></b>
                <form class="form-group" name="login" method="post" action="processa_login_admin.jsp">
                    <table id="dados" width="50%" align="center" class="table table-bordered table-striped">
                        <thead>
                           
                            <tr>
                                <th>Login </th>
                                <td><input class="form-control small" type="text" required required name="login"></td>
                                
                            </tr>
                           
                            
                            <tr>
                                <th>Senha: </th>
                                <td><input class="form-control small" type="password" required name="senha"></td>
                            </tr>
                            
                            
                            
                            
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="4">
                                    <input name="btn_log" type="submit" value="Logar" class="btn btn-primary">
                                </td>
                            </tr>
                        </tfoot>
                        
                    </table>
                </form>
        
    <%@ include file="includes/footer.jsp" %>
        
       