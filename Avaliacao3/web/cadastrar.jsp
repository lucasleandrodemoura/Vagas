<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>




<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
    <%@ page import ="br.univates.progweb.Curriculo" %>
    

                    
                
    <form class="form-group" name="cadastrar_basico" method="post" action="curriculo/cadastrar">
                    <table id="dados" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nome:</th>
                                <td colspan="3"><input class="form-control small" type="text" required name="nome"></td>
                            </tr>
                            
                            <tr>
                                <th>CPF: </th>
                                <td><input class="form-control small" onblur="validaCPF(this);" type="text" maxlength="11" required name="cpf"></td>
                                <th>Senha: </th>
                                <td><input class="form-control small" type="password" required name="senha"></td>
                            </tr>
                           
                            
                            <tr>
                                <th>E-mail: </th>
                                <td colspan="3"><input class="form-control small" type="email" required name="email"></td>
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
                                <td colspan="3"><input class="form-control small" type="text" required name="cidade"></td>
                                
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
        
        
        <%@ include file="includes/footer.jsp" %>
        
       