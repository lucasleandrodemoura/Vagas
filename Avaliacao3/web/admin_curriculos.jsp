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
                    <h3>Visualizando todos os curr�culos</h3>
                    
                        <table id="table_completo" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Nome:</th>
                                    <th>Cidade:</th>
                                    <th>Telefone:</th>
                                    <th>E-mail:</th>
                                    <th>Foto:</th>
                                    <th>A��es</th>
                                </tr>
                            </thead>      
                            <tbody>
                                <%
            Conexao conecta = new Conexao();
            ResultSet x = conecta.selecionar("SELECT idcurriculo,nome,nome_cidade,sigla,telefone,email,foto FROM curriculo INNER JOIN cidades ON cidades.codigo_cidade = curriculo.cidade_residencia INNER JOIN estado ON cidades.codigo_estado = estado.codigo_estado ORDER BY nome");
            while(x.next()){
                            
                    %>
                                <tr>
                                    <td><%=x.getString("nome")%></td>
                                    <td><%=x.getString("nome_cidade")%>/<%=x.getString("sigla")%></td>
                                    <td><%=x.getString("telefone")%></td>
                                    <td><%=x.getString("email")%></td>
                                    <td><img src="<%=request.getContextPath()%>/fotos/<%=x.getString("foto")%>" class="img-thumbnail img-responsive" width="80px"></td>
                                    <td><a href="editar_perfil.jsp?cod=<%=x.getString("idcurriculo")%>&visualizar=1" target="_blank" class="btn btn-default">Abrir</a>
                                    
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
        
       