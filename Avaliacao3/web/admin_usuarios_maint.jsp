<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="br.univates.progweb.models.Administradores"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
 <%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("select * from administradores WHERE codigo_usuario = "+request.getParameter("cod"));
                        Administradores administrador = new Administradores();
                        administrador.setCodigoUsuario(0);
                            administrador.setAtivo(false);
                            administrador.setEmail("");
                            administrador.setNome("");
                            administrador.setSenha("");
                        while(x.next()){
                            administrador.setCodigoUsuario(x.getInt("codigo_usuario"));
                            administrador.setAtivo(x.getBoolean("ativo"));
                            administrador.setEmail(x.getString("email"));
                            administrador.setNome(x.getString("nome"));
                            administrador.setSenha(x.getString("senha"));
                            
                        }
                        conecta.fechar();
            
                    %>

    <%@ include file="includes/header.jsp" %>
   <div class="conteudo">
                <div class="row">
                    <div class="col-lg-12">
                        <h3>Recrutadores</h3>
                        <form name="formulario" method="post" action="incluirAdministrador">
                            <input type="hidden" name="codigo_usuario" value="<%=administrador.getCodigoUsuario()%>">
                        <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td><input type="text" name="nome" maxlength="50" value="<%=administrador.getNome()%>" required class="form-control"></td>
                            </tr>
                            <tr>
                                <th>E-mail</th>
                                <td><input type="email" name="email" maxlength="50" value="<%=administrador.getEmail()%>" required class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Senha</th>
                                <td><input type="password" name="senha" maxlength="50" value="<%=administrador.getSenha()%>" required class="form-control"></td>
                            </tr>
                            <tr>
                                <th>Ativo</th>
                                <td><input type="checkbox" name="ativo" value="1" ></td>
                            </tr>
                          
                        </thead>
                        
                            <tr>
                                <td colspan="2">
                                 <input class="btn btn-primary" type="submit" value="Atualizar">
                                 
                                </td>
                            </tr>
                        
                    </table>
                    </form>
                    

                </div>  
                    </div>  

              </div>
        
    <%@ include file="includes/footer.jsp" %>
        
       