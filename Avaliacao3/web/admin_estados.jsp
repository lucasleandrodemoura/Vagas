<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<% 
if(session.getValue("logado_admin")==null){
    response.sendRedirect("admin.jsp");
}

%>

    <%@ include file="includes/header.jsp" %>
   <div class="conteudo">
                <div class="row">
                    <div class="col-lg-12">    
                    <div class="col-lg-12" align="right"><a class="btn btn-default" href="admin_estados_maint.jsp">Novo</a></div>
                    <h3>Estados</h3>
                    
                        <table id="table_completo" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Estado</th>
                                    <th>Sigla</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>      
                            <tbody>
                                  <%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("select * from estado");
                        while(x.next()){
                            
                             %>
                            
                             
                              <tr>
                                    <td><%=x.getString("nome_estado")%></td>
                                    <td><%=x.getString("sigla")%></td>
                                    
                                    
                                    <td><a href="javascript:excluir(<%=x.getString("codigo_estado")%>,'admin_estados','estado','codigo_estado');" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i></a>
                                    <a href="admin_estados_maint.jsp?cod=<%=x.getString("codigo_estado")%>" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i>
                                    </td>
                                </tr>
                             
                             
                            <%
                        }
                        conecta.fechar();
            
                    %>
                               
                            </tbody>     

                            
                        </table>
                    

                </div>  
                </div>
              </div>
        
    <%@ include file="includes/footer.jsp" %>
        
       