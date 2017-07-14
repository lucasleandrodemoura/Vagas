<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="br.univates.progweb.models.Cargos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<% 
if(session.getValue("logado_admin")==null){
    response.sendRedirect("admin.jsp");
}
%>


<%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("select * from cargos WHERE codigo_cargo = "+request.getParameter("cod"));
                         Cargos tx = new Cargos();
                         tx.setCodigoCargo(0);
                            tx.setDescricao("");
                            
                        while(x.next()){
                            tx.setCodigoCargo(x.getInt("codigo_cargo"));
                            tx.setDescricao(x.getString("descricao"));
                            
                           
                            
                        }
                        conecta.fechar();
            
                    %>


<%@ include file="includes/header.jsp" %>

<div class="conteudo">
    <div class="row">
        <div class="col-lg-12">
            <h3>Cargos</h3>
            
            <form name="formulario" method="post" action="incluirCargo">
<input type="hidden" name="codigo_cargo" maxlength="50" value="<%=tx.getCodigoCargo()%>" class="form-control">
                <table  class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Descrição:</th>
                            <td><input type="text" name="descricao" maxlength="50" value="<%=tx.getDescricao()%>" required class="form-control"></td>
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

