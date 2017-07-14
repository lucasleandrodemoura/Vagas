<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
 <%
        
        if(!session.getAttribute("logado_admin").equals(1)){
            response.sendRedirect("admin_logado.jsp");
        }
        
        %>

    <%@ include file="includes/header.jsp" %>
   
        <div class="conteudo">
            
                <div class="row">
                    <div class="col-lg-12">
                    <h3>Cadastro de vagas</h3>
                    <form class="form-group" name="cadastrar_basico" method="post" action="incluirVaga">
                        <table id="vaga" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Título:</th>
                                    <td><input class="form-control small" maxlength="50" type="text" required name="titulo"></td>
                                </tr>
                                
                                <tr>
                                    <th>Salário:</th>
                                    <td><input class="form-control small" type="number" step="0.01" required name="salario"></td>
                                </tr>
                                
                                <tr>
                                    <th>Vaga aberta até:</th>
                                    <td><input class="form-control small" type="date" required name="aberto_ate"></td>
                                </tr>
                                
                                <tr>
                                <th>Cidade de trabalho: </th>
                                <td>
                                    
                                    <select class="form-control small" required name="cidade">
                                        <option value=""></option>
                                        <%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("SELECT codigo_cidade,nome_cidade FROM cidades INNER JOIN estado ON cidades.codigo_estado = estado.codigo_estado ORDER BY nome_cidade");
                        while(x.next()){
                            
                            out.print("<option value='"+x.getString("codigo_cidade")+"'>"+x.getString("nome_cidade")+"</option>");
                        }
                        conecta.fechar();
            
                    %>
                                    </select>
                                </td>
                            </tr>
                                
                                
                                <tr>
                                    <th>Requisitos:</th>
                                    <td><textarea class="form-control small" maxlength="255" required name="requisitos"></textarea></td>
                                </tr>
                                <tr>
                                    <th>Descrição:</th>
                                    <td><textarea class="form-control small" maxlength="255" required name="descricao"></textarea></td>
                                </tr>
                                </thead>    
                                <tfoot>
                                 <tr>
                                     <td colspan="2">
                                         
                                         <input type="submit" class="btn btn-primary" name="btn_cadastrar" value="Cadastrar">
                                     </td>
                                    
                                </tr>
                                
                                </tfoot>

                            
                        </table>
                    </form>

                </div>  

              </div>
            </div>
    <%@ include file="includes/footer.jsp" %>
        
       
