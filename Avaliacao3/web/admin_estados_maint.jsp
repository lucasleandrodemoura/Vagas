<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="br.univates.progweb.models.Estado"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<% 
if(session.getValue("logado_admin")==null){
    response.sendRedirect("admin.jsp");
}
%>


<%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("select * from estado WHERE codigo_estado = "+request.getParameter("cod"));
                         Estado tx = new Estado();
                        
                        while(x.next()){
                            tx.setCodigoEstado(x.getInt("codigo_estado"));
                            tx.setNomeEstado(x.getString("nome_estado"));
                            tx.setSigla(x.getString("sigla"));
                           
                            
                        }
                        conecta.fechar();
            
                    %>

    <%@ include file="includes/header.jsp" %>
   <div class="conteudo">
                <div class="row">
                    <div class="col-lg-12">
                        <h3>Estados</h3>
                        <form name="formulario" method="post" action="incluirEstados">
                            <input type="hidden" name="codigo_estado" maxlength="50" value="<%=tx.getCodigoEstado()%>" class="form-control">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td><input type="text" name="nome" maxlength="50" value="<%=tx.getNomeEstado()%>" required class="form-control"></td>
                            </tr>
                            
                             <tr>
                                <th>Sigla:</th>
                                <td><input type="text" name="sigla" maxlength="2" value="<%=tx.getSigla()%>" required class="form-control"></td>
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
        
       