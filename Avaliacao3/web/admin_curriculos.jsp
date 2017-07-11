<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
   <div class="conteudo">
                <div class="row">
                    <div class="col-lg-12">
                    <h3>Visualizando todos os currículos</h3>
                    
                        <table id="table_completo" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Nome:</th>
                                    <th>Cidade:</th>
                                    <th>Telefone:</th>
                                    <th>E-mail:</th>
                                    <th>Foto:</th>
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
                                    <td>Lajeado/RS</td>
                                    <td>5199999999</td>
                                    <td>lucasleandrodemoura@gmail.com</td>
                                    <td><img src="fotos/exemplo.jpg" class="img-thumbnail img-responsive" width="80px"></td>
                                    <td><a href="editar_perfil.jsp" target="_blank" class="btn btn-default">Abrir</a>
                                    
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
        
       