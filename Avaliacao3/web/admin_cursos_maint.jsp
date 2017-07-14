<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="br.univates.progweb.models.Cursos"%>
<%@page import="br.univates.progweb.models.Estado"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
   <% 
if(session.getValue("logado_admin")==null){
    response.sendRedirect("admin.jsp");
}
%>


    <%
                        Conexao conecta = new Conexao();
                        ResultSet x = conecta.selecionar("select * from cursos WHERE codigo_curso = "+request.getParameter("cod"));
                         Cursos tx = new Cursos();
                        tx.setCodigoCurso(0);
                            tx.setNivel(0);
                            tx.setNomeCurso("");
                        while(x.next()){
                            tx.setCodigoCurso(x.getInt("codigo_curso"));
                            tx.setNivel(Integer.parseInt(x.getString("nivel")));
                            tx.setNomeCurso(x.getString("nome_curso"));
                           
                        }
                        conecta.fechar();
            
                    %>
    
        <div class="conteudo">
                <div class="row">
                    <div class="col-lg-12">
                    <h3>Cursos</h3>
                    <form name="formulario" method="post" action="incluirCurso">
                        <input type="hidden" name="codigo_curso" maxlength="50" value="<%=tx.getCodigoCurso()%>" class="form-control">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td><input type="text" name="descricao" maxlength="50"  value="<%=tx.getNomeCurso()%>" required class="form-control"></td>
                            </tr>
                            
                             <tr>
                                <th>Nível</th>
                                <td><select class="form-control" name="nivel" required>
                                        
                                        <option value="1" <% if(tx.getNivel()==1) { out.print("selected"); } %>>Médio</option>
                                        <option value="2" <% if(tx.getNivel()==2) { out.print("selected"); } %>>Técnico</option>
                                        <option value="3" <% if(tx.getNivel()==3) { out.print("selected"); } %>>Superior</option>
                                        <option value="4" <% if(tx.getNivel()==4) { out.print("selected"); } %>>Pós-Graduação</option>
                                    </select>
                                </td>
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
        
       