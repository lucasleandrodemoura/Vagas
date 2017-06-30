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
                    <h3>Visualizando todos os currículos</h3>
                    
                        <table id="candidatos" class="table table-bordered table-striped table-hover">
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
                                <tr>
                                    <td>Lucas Leandro de Moura</td>
                                    <td>Lajeado/RS</td>
                                    <td>5199999999</td>
                                    <td>lucasleandrodemoura@gmail.com</td>
                                    <td><img src="fotos/exemplo.jpg" class="img-thumbnail img-responsive" width="80px"></td>
                                    <td><a href="editar_perfil.jsp" target="_blank" class="btn btn-default">Abrir</a>
                                    
                                    </td>
                                </tr>
                            </tbody>     

                            
                        </table>
                    

                </div>  

              </div>
        
    <%@ include file="includes/footer.jsp" %>
        
       