<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
   <div class="conteudo">
                <div class="row">
                    <div class="col-lg-12">
                    <div class="col-lg-12" align="right"><a class="btn btn-default" href="admin_usuarios_maint.jsp">Novo</a></div>                
                    <h3>Recrutadores</h3>
                    
                        <table id="table_completo" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nome</th>
                                    <th>E-mail</th>
                                    
                                    <th>Ações</th>
                                </tr>
                            </thead>      
                            <tbody>
                                   <%
                                  
                                          
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("SELECT codigo_usuario,nome,email FROM administradores ORDER BY nome");
                        while(x.next()){
                            
                             %>
                                <tr>
                                    <td><%=x.getString("codigo_usuario")%></td>
                                    <td><%=x.getString("nome")%></td>
                                    <td><%=x.getString("email")%></td>
                                    
                                    <td><a href="javascript:javascript:excluirRegistro(<%=x.getString("codigo_usuario")%>,'ExcluirAdministrador');" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i></a>
                                        <a href="?cod=<%=x.getString("codigo_usuario")%>" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i>
                                    </td>
                                </tr>
                                    <% 
                                }
                                %>
                            </tbody>     

                            
                        </table>
                    

                </div>  
                    </div>  

              </div>
        
    <%@ include file="includes/footer.jsp" %>
        
       