<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="br.univates.progweb.models.Instituicoes"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("select * from instituicoes WHERE codigo_instituicao = "+request.getParameter("cod"));
                         Instituicoes tx = new Instituicoes();
                         tx.setCodigoInstituicao(0);
                            tx.setNome("");
                        while(x.next()){
                            tx.setCodigoInstituicao(x.getInt("codigo_instituicao"));
                            tx.setNome(x.getString("nome"));
                           
                            
                        }
                        conecta.fechar();
            
                    %>

    <%@ include file="includes/header.jsp" %>
   <div class="conteudo">
                <div class="row">
                    <div class="col-lg-12">
                                        
                    <h3>Instituiçao de ensino</h3>
                    <form name="formulario" method="post" action="incluirInstituicao">
                        <input type="hidden" name="codigo_instituicao" value="<%=tx.getCodigoInstituicao()%>">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td><input type="text" name="nome" maxlength="50" value="<%=tx.getNome()%>" required class="form-control"></td>
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
        
       