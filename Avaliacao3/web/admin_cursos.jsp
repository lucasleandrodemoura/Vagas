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
                        
                    <div class="col-lg-12" align="right"><a class="btn btn-default" href="admin_cursos_maint.jsp">Novo</a></div>
                    
                    <h3>Cursos</h3>
                    
                        <table id="table_completo" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Cursos</th>
                                    <th>Nível</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>      
                            <tbody>
                                <%
            Conexao conecta = new Conexao();
            ResultSet x = conecta.selecionar("select codigo_curso,nome_curso, "
                    + "CASE "
                    + "WHEN nivel = 1 THEN 'Médio' "
                    + "WHEN nivel = 2 THEN 'Técnico' "
                    + "WHEN nivel = 3 THEN 'Superior' "
                    + "WHEN nivel = 4 THEN 'Pós-Graduação' "
                    + "ELSE 'Não informado' END as nivel  "
                    + "from cursos "
                    + "order by nome_curso");
            while(x.next()){
                            
                    %>

                    <tr>

                        <td><%=x.getString("nome_curso")%></td>
                        <td><%=x.getString("nivel")%></td>


                        <td><a href="javascript:excluir(<%=x.getString("codigo_curso")%>,'admin_cursos','cursos','codigo_curso');" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i></a>
                            <a href="admin_cursos_maint.jsp?cod=<%=x.getString("codigo_curso")%>" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i>
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
        
       