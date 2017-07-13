<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
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
}else {
%>

<%
    
    Curriculo candidato = new Curriculo(Integer.parseInt(session.getAttribute("id_curriculo").toString()));
    
    
    
%>

    <div class="col-lg-12">
        <form method="post" action="editarPerfil?id_curriculo=<%=session.getAttribute("id_curriculo").toString()%>">
            <h3>Dados básicos</h3>
            <table id="dados" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td colspan="3"><input class="form-control small" type="text" value="<%=candidato.getNome()%>" required name="nome"></td>
                            </tr>
                            
                            <tr>
                                <th>CPF: </th>
                                <td><input class="form-control small cpf" value="<%=candidato.getCpf()%>" type="text" maxlength="11" required name="cpf"></td>
                                <th>E-mail: </th>
                                <td><input class="form-control small" type="email" value="<%=candidato.getEmail()%>" required name="email"></td>
                                
                            </tr>
                            
                            <tr>
                                <th>Pretensao Salarial: </th>
                                <td><input class="form-control small cpf" value="<%=candidato.getPretencaoSalarial()%>" type="text" required name="pretensao_salarial"></td>
                                <th></th>
                                <td></td>
                                
                            </tr>
                           
                            
                            <tr>
                                <th>Senha: </th>
                                <td colspan="3"><input class="form-control small" value="<%=candidato.getSenha()%>" type="password" required name="senha"></td>
                            </tr>
                            
                            
                            <tr>
                                <th>Estado Civil: </th>
                                <td>
                                    
                                    <select class="form-control small" required name="estadoCivil">
                                        <option value="0" <% 
                                        if(candidato.getEstadoCivil()==0)
                                        { 
                                            out.print("selected");
                                        } 
                                        %> >Solteiro</option>
                                        <option value="1"
                                                <% 
                                        if(candidato.getEstadoCivil()==1)
                                        { 
                                            out.print("selected");
                                        } 
                                        %>>Casado</option>
                                        <option value="2"
                                                <% 
                                        if(candidato.getEstadoCivil()==2)
                                        { 
                                            out.print("selected");
                                        } 
                                        %>>União Estável</option>
                                        <option value="3"
                                                <% 
                                        if(candidato.getEstadoCivil()==3)
                                        { 
                                            out.print("selected");
                                        } 
                                        %>>Outros</option>
                                    </select>
                                </td>
                                <th>Data nascimento: </th>
                                <td><input class="form-control small" type="date" value="<%=candidato.getDataNascimento()%>" required name="dataNascimento"></td>
                            </tr>
                            
                            
                             <tr>
                                <th>Endereço: </th>
                                <td><input class="form-control small" type="text" value="<%=candidato.getEndereco()%>" required name="endereco"></td>
                                <th>Bairro: </th>
                                <td><input class="form-control small" type="text" value="<%=candidato.getBairro()%>" required name="bairro"></td>
                            </tr>
                            
                            
                              <tr>
                                <th>Cidade: </th>
                                <td colspan="3">
                                    
                                    <select class="form-control small" required name="cidade">
                                        <option value=""></option>
                                        <%
                                            Conexao conecta = new Conexao();
                                            int cidade_candidato = candidato.getCidade_residencia();
                                                
                                            ResultSet x = conecta.selecionar("SELECT codigo_cidade,nome_cidade,sigla FROM cidades INNER JOIN estado ON cidades.codigo_estado = estado.codigo_estado ORDER BY sigla,nome_cidade");
                                            while(x.next()){
                                                
                                            
                                                String select = "";
                                                if(cidade_candidato==Integer.parseInt(x.getString("codigo_cidade"))){
                                                    select = "selected";
                                                }
                                                out.print("<option value='"+x.getString("codigo_cidade")+"' "+select+">"+x.getString("nome_cidade")+"/"+x.getString("sigla")+"</option>");
                                            }
                                            conecta.fechar();
                                        %>
                                    </select>
                                    
                                </td>
                                
                            </tr>
                            
                             <tr>
                                <th>Telefone: </th>
                                <td><input class="form-control small" value="<%=candidato.getTelefone()%>" type="tel"  name="telefone"></td>
                                <th>Celular: </th>
                                <td><input class="form-control small" type="tel" value="<%=candidato.getCelular()%>"  name="celular"></td>
                            </tr>
                            <tr>
                                <th>Foto: </th>
                                <td colspan="3"><input class="form-control small" value="<%=candidato.getFoto()%>" type="file"  name="foto"></td>
                                
                            </tr>
                         
                            
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="4">
                                    <input name="btn_ok" type="submit" value="Proximo" class="btn btn-primary">
                                </td>
                            </tr>
                        </tfoot>
                        
                    </table>
            
            
        </form>
    </div>
                                <% } %>
        <%@ include file="includes/footer.jsp" %>
        
       