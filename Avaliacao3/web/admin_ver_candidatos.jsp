<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="br.univates.progweb.models.Vagas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
   
        <div class="conteudo">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-lg-12" align="right"><a class="btn btn-default" href="admin_logado.jsp">Voltar</a></div>
                    <% 
                        Vagas InfoVAGA = new Vagas(Integer.parseInt(request.getParameter("cod")));
                        
                    %>
                    <h3>Visualizar candidatos para a vaga de <b><%=InfoVAGA.getTitulo()%></b></h3>
                    
                        <table id="candidatos" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Nome:</th>
                                    <th>Cidade:</th>
                                    <th>Telefone:</th>
                                    <th>E-mail:</th>
                                    
                                    <th>Ações</th>
                                </tr>
                            </thead>      
                            <tbody>
                                <%
            Conexao conecta = new Conexao();
            ResultSet x = conecta.selecionar("SELECT idcurriculo,nome,nome_cidade,sigla,telefone,email,foto FROM curriculo INNER JOIN cidades ON cidades.codigo_cidade = curriculo.cidade_residencia INNER JOIN estado ON cidades.codigo_estado = estado.codigo_estado INNER JOIN candidatura ON candidatura.codigo_candidato = curriculo.idcurriculo WHERE candidatura.codigo_vaga = "+request.getParameter("cod")+" ORDER BY nome");
            while(x.next()){
                            
                    %>
                                <tr>
                                    <td><%=x.getString("nome")%></td>
                                    <td><%=x.getString("nome_cidade")%>/<%=x.getString("sigla")%></td>
                                    <td><%=x.getString("telefone")%></td>
                                    <td><%=x.getString("email")%></td>
                                    
                                    <td><a href='javascript:window.open("admin_abrir_curriculo.jsp?cod=<%=x.getString("idcurriculo")%>", "", "width=700,height=600");' class="btn btn-default">Abrir</a>
                                        <a href='javascript:window.open("admin_parecer.jsp?cod=<%=x.getString("idcurriculo")%>&codigo_vaga=<%=request.getParameter("cod")%>", "", "width=500,height=300");' class="btn btn-default">Parecer</a>
                                        <a href='javascript:window.open("contratarFuncionario?codigo_curriculo=<%=x.getString("idcurriculo")%>&codigo_vaga=<%=request.getParameter("cod")%>", "", "width=200,height=150");' class="btn btn-primary">Contratar</a>
                                    
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
        
       