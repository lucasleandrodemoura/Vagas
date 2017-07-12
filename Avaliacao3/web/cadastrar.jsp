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
    <%@ page import ="br.univates.progweb.models.Curriculo" %>
    
    <div class="col-lg-12">
    <h3>Cadastre-se</h3>
    <form class="form-group" name="cadastrar_basico" method="post" action="incluirCurriculo">
                    <table id="dados" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td colspan="3"><input class="form-control small" type="text" required name="nome"></td>
                            </tr>
                            
                            <tr>
                                <th>CPF: </th>
                                <td><input class="form-control small cpf" onbluir="validaCPF(this);" type="text" maxlength="11" required name="cpf"></td>
                                <th>E-mail: </th>
                                <td><input class="form-control small" type="email" required name="email"></td>
                                
                            </tr>
                           
                            
                            <tr>
                                <th>Senha: </th>
                                <td colspan="3"><input class="form-control small" type="password" required name="senha"></td>
                            </tr>
                            
                            
                            <tr>
                                <th>Estado Civil: </th>
                                <td>
                                    
                                    <select class="form-control small" required name="estadoCivil">
                                        <option value="0">Solteiro</option>
                                        <option value="1">Casado</option>
                                        <option value="2">União Estável</option>
                                        <option value="3">Outros</option>
                                    </select>
                                </td>
                                <th>Data nascimento: </th>
                                <td><input class="form-control small" type="date" required name="dataNascimento"></td>
                            </tr>
                            
                            
                             <tr>
                                <th>Endereço: </th>
                                <td><input class="form-control small" type="text" required name="endereco"></td>
                                <th>Bairro: </th>
                                <td><input class="form-control small" type="text" required name="bairro"></td>
                            </tr>
                            
                            
                              <tr>
                                <th>Cidade: </th>
                                <td colspan="3">
                                    <select class="form-control small" required name="cidade">
                                        <option value=""></option>
                                        <%
                                            Conexao conecta = new Conexao();
                                            ResultSet x = conecta.selecionar("SELECT codigo_cidade,nome_cidade,sigla FROM cidades INNER JOIN estado ON cidades.codigo_estado = estado.codigo_estado ORDER BY sigla,nome_cidade");
                                            while(x.next()){

                                                out.print("<option value='"+x.getString("codigo_cidade")+"'>"+x.getString("nome_cidade")+"/"+x.getString("sigla")+"</option>");
                                            }
                                            conecta.fechar();
                                        %>
                                    </select>
                                    
                                </td>
                                
                            </tr>
                            
                             <tr>
                                <th>Telefone: </th>
                                <td><input class="form-control small" type="tel"  name="telefone"></td>
                                <th>Celular: </th>
                                <td><input class="form-control small" type="tel"  name="celular"></td>
                            </tr>
                         
                            
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="4">
                                    <input name="btn_ok" type="submit" value="Cadastrar" class="btn btn-primary">
                                </td>
                            </tr>
                        </tfoot>
                        
                    </table>
                </form>
        
        </div>
        <%@ include file="includes/footer.jsp" %>
        
       