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
                        <div class="col-lg-12" align="right"><a class="btn btn-default" href="admin_instituicoes_maint.jsp">Novo</a></div>                
                    <h3>Instituiçao de ensino</h3>
                        
                        <table id="table_completo" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nome</th>
                                    
                                    <th>Ações</th>
                                </tr>
                            </thead>      
                            <tbody>
                                 <%
            Conexao conecta = new Conexao();
            ResultSet x = conecta.selecionar("select * from instituicoes");
            while(x.next()){
                            
                    %>

                    <tr>
                        <td><%=x.getString("codigo_instituicao")%></td>
                        <td><%=x.getString("nome")%></td>
                        


                        <td><a href="javascript:excluir(<%=x.getString("codigo_instituicao")%>,'admin_instituicoes','instituicoes','codigo_instituicao');" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i></a>
                            <a href="admin_instituicao_maint.jsp?cod=<%=x.getString("codigo_instituicao")%>" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i>
                        </td>
                    </tr>

                    <% 
                    }
                    %>
                            </tbody>     

                            
                        </table>
                    

                </div>  </div>  

              </div>
        
    <%@ include file="includes/footer.jsp" %>
        
       