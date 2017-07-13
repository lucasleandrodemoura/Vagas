<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


<%@ include file="includes/header.jsp" %>

<div class="conteudo">
    <div class="row">
        <div class="col-lg-12">


            

            <div class="col-lg-12" align="right"><a class="btn btn-default" href="admin_cargos_maint.jsp">Novo</a></div>
            
            <h3>Cargos</h3>
            <table id="table_completo" class="table table-bordered table-striped table-hover dataTable">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Ações</th>
                    </tr>
                </thead>      
                <tbody>
                    <%
            Conexao conecta = new Conexao();
            ResultSet x = conecta.selecionar("SELECT codigo_cargo,descricao FROM cargos ORDER BY descricao");
            while(x.next()){
                            
                    %>

                    <tr>

                        <td><%=x.getString("descricao")%></td>


                        <td><a href="javascript:excluir(<%=x.getString("codigo_cargo")%>,'admin_cargos','cargos','codigo_cargo');" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i></a>
                            <a href="admin_cargos_maint.jsp?cod=<%=x.getString("codigo_cargo")%>" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i>
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

