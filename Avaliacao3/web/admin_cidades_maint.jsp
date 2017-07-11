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
                        <h3>Cidades</h3>
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
        
       