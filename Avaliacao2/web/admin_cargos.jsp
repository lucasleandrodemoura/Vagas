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
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Descrição:</th>
                                <td><input type="text" name="descricao" maxlength="50" required class="form-control"></td>
                            </tr>
                          
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                 <input class="btn btn-primary" type="submit" value="Atualizar">
                                 
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                    
                    <h3>Cargos Cadastradas</h3>
                    
                        <table id="candidatos" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    
                                    
                                    <th>Ações</th>
                                </tr>
                            </thead>      
                            <tbody>
                                <tr>
                                    <td>Farmaceutico</td>
                                    
                                    
                                    <td><a href="#" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i></a>
                                    <a href="#" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i>
                                    </td>
                                </tr>
                            </tbody>     

                            
                        </table>
                    

                </div>  

              </div>
    <%@ include file="includes/footer.jsp" %>
        
       