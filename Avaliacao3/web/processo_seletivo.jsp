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
   <% 
if(session.getValue("logado")==null){
    response.sendRedirect("index.jsp");
}else {
    String id_curriculo = session.getAttribute("id_curriculo").toString();
%>


<div class="conteudo">
    <div class="row">
        <div class="col-lg-12">


            <h3>Ver processos seletivos</h3>
            <table id="table_completo" class="table table-bordered table-striped table-hover dataTable">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Vaga</th>
                        <th>Parecer</th>
                    </tr>
                </thead>      
                <tbody>
                    <%
            Conexao conecta = new Conexao();
            ResultSet x = conecta.selecionar("select curriculo.nome,vagas.titulo,candidatura.parecer from candidatura INNER JOIN vagas ON candidatura.codigo_vaga = vagas.idvagas INNER JOIN curriculo ON candidatura.codigo_candidato = curriculo.idcurriculo WHERE curriculo.idcurriculo = "+id_curriculo);
            while(x.next()){
                            
                    %>

                    <tr>

                        <td><%=x.getString("nome")%></td>
                        <td><%=x.getString("titulo")%></td>
                        <td><%=x.getString("parecer")%></td>


                        
                    </tr>

                    <% 
                    }
                    %>
                </tbody>     


            </table>
        </div>

    </div>  
<% } %>
</div>
                    
<%@ include file="includes/footer.jsp" %>

