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
                    <div class="col-lg-12" align="right"><a class="btn btn-default" href="admin_cidades_maint.jsp">Novo</a></div>
                    <h3>Cidades</h3>
                    
                        <table id="table_completo" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Cidade</th>
                                    <th>Estado</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>      
                            <tbody>
                                  <%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("SELECT codigo_cidade,nome_cidade,sigla FROM cidades INNER JOIN estado ON cidades.codigo_estado = estado.codigo_estado ORDER BY nome_cidade");
                        while(x.next()){
                            
                             %>
                            
                             
                              <tr>
                                    <td><%=x.getString("nome_cidade")%></td>
                                    <td><%=x.getString("sigla")%></td>
                                    
                                    
                                    <td><a href="excluirCidade?cod=<%=x.getString("codigo_cidade")%>" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i></a>
                                    <a href="admin_cidades_maint.jsp?cod=<%=x.getString("codigo_cidade")%>" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i>
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
        
       