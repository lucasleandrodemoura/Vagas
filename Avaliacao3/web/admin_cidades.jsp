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
                        <form name="formulario" method="post" action="incluirCidade">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td><input type="text" name="nome" maxlength="50" required class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Estado:</th>
                                <td><select class="form-control" required name="estado">
             <%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("select codigo_estado,sigla from estado ORDER BY sigla");
                        while(x.next()){
                            
                            out.print("<option value='"+x.getString("codigo_estado")+"'>"+x.getString("sigla")+"</option>");
                        }
                        conecta.fechar();
            
                    %>
                                    </select></td>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                 <input class="btn btn-primary" type="submit" value="Gravar">
                                 
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                        </form>
                    
                    <h3>Cidades Cadastradas</h3>
                    
                        <table id="candidatos" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Cidade</th>
                                    <th>Estado</th>
                                    <th>A��es</th>
                                </tr>
                            </thead>      
                            <tbody>
                                  <%
                        conecta = new Conexao();
                        x = conecta.selecionar("SELECT codigo_cidade,nome_cidade,sigla FROM cidades INNER JOIN estado ON cidades.codigo_estado = estado.codigo_estado ORDER BY nome_cidade");
                        while(x.next()){
                            
                             %>
                            
                             
                              <tr>
                                    <td><%=x.getString("nome_cidade")%></td>
                                    <td><%=x.getString("sigla")%></td>
                                    
                                    
                                    <td><a href="excluirCidade?cod=<%=x.getString("codigo_cidade")%>" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i></a>
                                    <a href="?cod=<%=x.getString("codigo_cidade")%>" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i>
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
        
       