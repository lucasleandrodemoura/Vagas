<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>

<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.univates.progweb.models.Cargos"%>
<%@page import="br.univates.progweb.models.Experiencia"%>
<%@page import="br.univates.progweb.models.Curriculo"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


<%@ include file="includes/header.jsp" %>

<% 
    
    
if(session.getValue("logado")==null){
    response.sendRedirect("index.jsp");
} else {
%>
<%
    
    
    
    
    
    
%>

    <div class="col-lg-12">
        <form method="post" action="incluiFormacao?codigo_experiencia=<%=request.getParameter("codigo_experiencia")%>&id_curriculo=<%=session.getAttribute("id_curriculo").toString()%>">
            
            <h3>Formação</h3>
            <table id="dados" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nome da empresa:</th>
                                <td colspan="3"><input class="form-control small" type="text" value="" required name="nome_empresa"></td>
                            </tr>
                            
                            <tr>
                                <th>Inicio </th>
                                <td><input class="form-control small cpf" value="" type="date" required name="data_de"></td>
                                <th>Termino: </th>
                                <td><input class="form-control small" type="date" value="" name="data_ate"></td>
                                
                            </tr>
                           
                            
                            
                            
                              <tr>
                                <th>Último cargo: </th>
                                <td colspan="3">
                                    <select class="form-control small" required name="cidade">
                                        <option value=""></option>
                                        <%
                                            Conexao conecta = new Conexao();
                                            ResultSet x = conecta.selecionar("SELECT codigo_cargo,descricao FROM cargos ORDER BY descricao");
                                            while(x.next()){
                                                
                                                out.print("<option value='"+x.getString("codigo_cargo")+"'>"+x.getString("descricao")+"</option>");
                                            }
                                            conecta.fechar();
                                        %>
                                    </select>
                                    
                                </td>
                                
                            </tr>
                            
                             <tr>
                                <th>Atividades desempenhadas: </th>
                                <td colspan="3"><textarea name="atividades_desempenhadas" required class="form-control small"></textarea></td>
                            </tr>
                         
                            
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="4">
                                    <input name="btn_ok" type="submit" value="Adicionar" class="btn btn-success">
                                </td>
                            </tr>
                        </tfoot>
                        
                    </table>
                      
            <table class="table table-bordered table-striped table-hover" id="table_completo">
                <thead>
                    <tr>
                        <th>Nome da empresa</th>
                        <th>Ultimo cargo</th>
                        <th>Inicio</th>
                        <th>Fim</th>
                    </tr>
                </thead>
                    <%
                      String s = "select nome_empresa, ultimo_cargo_ocupado, data_de, data_ate, codigo_experiencia from experiencia where codigo_curriculo = "+session.getAttribute("id_curriculo").toString();
                      Conexao conecExperiencias = new Conexao();
                      ResultSet t = conecExperiencias.selecionar(s);
                      while(t.next()){
                          
                       %>
                    <tr>
                        <td><%=t.getString("nome_empresa")%></td>
                        <td><%=t.getString("ultimo_cargo_ocupado")%></td>
                        <td><%=t.getString("data_de")%></td>
                        <td><%=t.getString("data_ate")%></td>
                    </tr>   
                    <%   
                      }
                     conecExperiencias.fechar();
                      
                    %>
                    
                    </table>
                                    
            
            
        </form>
                                    <div class="row">
                                        <div class="col-lg-6" style="text-align: right"><a name="btn_next" href="editar_perfil.jsp" class="btn btn-warning">Voltar</a></div>
                                        <div class="col-lg-6"><a name="btn_next" href="editar_formacao.jsp" class="btn btn-primary">Proximo</a></div>
                                    </div>
    </div>
<%
    }
%>
        <%@ include file="includes/footer.jsp" %>
        
       