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
            <h3>Cargos</h3>
            
            <form name="formulario" method="post" action="incluirCargo">

                <table  class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Descrição:</th>
                            <td><input type="text" name="descricao" maxlength="50" required class="form-control"></td>
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

