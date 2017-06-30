<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="br.univates.progweb.Cargos"%>
<%@page import="br.univates.progweb.Experiencia"%>
<%@page import="br.univates.progweb.Estado"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


    <%@ include file="includes/header.jsp" %>
    <%@ page import ="br.univates.progweb.Curriculo" %>
    

                    
                
    <%
        //Lista todas as vagas
       
       Curriculo candidato = new Curriculo();
       candidato.setBairro("Industrias");
            
      
            
    %>
                            

    <div class="col-lg-12">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation"><a href="#profile" role="tab" aria-controls="profile" data-toggle="tab">Dados básicos</a> 
                    <li role="presentation"><a href="#experiencias" role="tab" aria-controls="experiencias" data-toggle="tab">Experiências</a> </li>
                    <li role="presentation"><a href="#formacao" role="tab" aria-controls="formacao" data-toggle="tab">Formação</a> </li>
                    <li role="presentation"><a href="#processos_seletivos" role="tab" aria-controls="processos_seletivos" data-toggle="tab">Processos seletivos</a> </li>
                </ul>
                <div class="tab-content">
                    <div id="profile" class="tab-pane" role="tabpanel">

                        <form class="form-group" name="cadastrar_basico" method="post" action="index.html">
                            <table id="dados" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Nome:</th>
                                        <td colspan="3"><input class="form-control small" type="text" maxlength="150" value="<% out.print(candidato.getNome()); %>" required name="nome"></td>
                                    </tr>

                                    <tr>
                                        <th>CPF: </th>
                                        <td><input class="form-control small" type="text" value="<% out.print(candidato.getCpf()); %>" maxlength="11" required name="cpf"></td>
                                        <th>Senha: </th>
                                        <td><input class="form-control small" type="password" value="<% out.print(candidato.getSenha()); %>" maxlength="50" required name="senha"></td>
                                    </tr>


                                    <tr>
                                        <th>E-mail: </th>
                                        <td colspan="3"><input class="form-control small" type="email" value="<% out.print(candidato.getEmail()); %>" maxlength="50" required name="email"></td>
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
                                        <td><input class="form-control small" type="date" value="<% out.print(candidato.getDataNascimento().toString()); %>" required name="dataNascimento"></td>
                                    </tr>


                                    <tr>
                                        <th>Endereço: </th>
                                        <td><input class="form-control small" type="text" value="<% out.print(candidato.getEndereco()); %>" maxlength="255" required name="endereco"></td>
                                        <th>Bairro: </th>
                                        <td><input class="form-control small" type="text" value="<% out.print(candidato.getBairro()); %>" required maxlength="50" name="bairro"></td>
                                    </tr>


                                    <tr>
                                        <th>Cidade: </th>
                                        <td colspan="3">
                                    
                                    <select class="form-control small" required name="cidade">
                                        <option value=""></option>
                                        <option value="1">Exemplo</option>
                                    </select>
                                </td>

                                    </tr>

                                    <tr>
                                        <th>Telefone: </th>
                                        <td><input class="form-control small" value="<% out.print(candidato.getTelefone()); %>" type="tel" name="telefone"></td>
                                        <th>Celular: </th>
                                        <td><input class="form-control small" type="tel" value="<% out.print(candidato.getCelular()); %>"  name="celular"></td>
                                    </tr>
                                    
                                    <tr>
                                        <th>PDF: </th>
                                        <td><input class="form-control small" value="<% out.print(candidato.getPdf()); %>" type="file" required  name="pdf"></td>
                                        <th>Foto: </th>
                                        <td><input class="form-control small" type="file" value="<% out.print(candidato.getFoto()); %>" required name="foto"></td>
                                    </tr>


                                </thead>
                                <tfoot>
                                    <tr>
                                        <td colspan="4">
                                            <input name="btn_ok" type="submit" value="Atualizar" class="btn btn-success">
                                        </td>
                                    </tr>
                                </tfoot>

                            </table>

                            <div>



                            </div>
                        </form>

                    </div>
                    <div id="experiencias" class="tab-pane" role="tabpanel">
                        
                        <form class="form-group" name="cadastrar_experiencia" method="post" action="index.html">
                            <table id="dados_experiencia_cadastrar" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Nome da empresa:</th>
                                        <td colspan="3"><input class="form-control small" type="text" required name="nome_empresa"></td>
                                    </tr>
                                    <tr>
                                        <th>Cargo: </th>
                                        <td colspan="3">

                                            <select class="form-control small" required name="ocupacao">
                                                <option value="1">....</option>
                                                <option value="2">.......</option>
                                                <option value="3">...........</option>
                                                <option value="4">Outros</option>
                                            </select>
                                        </td>
                                        
                                    </tr>


                                    <tr>
                                        <th>Data de: </th>
                                        <td><input class="form-control small" type="date" required name="dataDe"></td>
                                        <th>Data até: </th>
                                        <td><input class="form-control small" type="date" name="dataAte"></td>
                                    </tr>


                                    <tr>
                                        <th>Atividades desempenhadas: </th>
                                        <td colspan="3">
                                            <textarea class="form-control small" type="text" name="atividadesDesempenhadas"></textarea>
                                        </td>

                                    </tr>

                                    


                                </thead>
                                <tfoot>
                                    <tr>
                                        <td colspan="4">
                                            <input name="btn_ok" type="submit" value="Incluir experiência" class="btn btn-success">
                                        </td>
                                    </tr>
                                </tfoot>

                            </table>
                        
                        </form>
                        
                        <table class="table table-bordered table-striped" id="btn_listar_experiencias">
                            <thead>
                                <tr>
                                    <th>Empresa</th>
                                    <th>Cargo</th>
                                    <th>Período</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            
                            <% 
                                Experiencia experiencias = new Experiencia();
                                experiencias.setCodigoCurriculo(candidato);
                                experiencias.setCodigoExperiencia(0);
                                experiencias.setNomeEmpresa("Dinacon");
                                experiencias.setAtividadesDesempenhadas("Codificação de sistemas");
                                Cargos cargo = new Cargos();
                                cargo.setCodigoCargo(1);
                                cargo.setDescricao("Programador");
                                experiencias.setUltimoCargoOcupado(cargo);
                                
                                ArrayList<Experiencia> lista = new ArrayList();
                                lista.add(experiencias);
                                


                                for(int a = 1; a <= lista.size(); a++) {
                            %>
                            
                                <tr>
                                    <td><% out.print(lista.get(a).getNomeEmpresa()); %></td>
                                    <td><% out.print(lista.get(a).getUltimoCargoOcupado().getDescricao()); %></td>
                                    <td><% out.print(lista.get(a).getDataDe().toString()); %> - <% out.print(lista.get(a).getDataAte().toString()); %></td>
                                    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a><a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
                                </tr>
                                
                                <%  } %>
                                
                                
                                <tfoot>
                                    <tr>
                                        <td colspan="4"><small><% out.print(lista.size()); %> cadastros</small></td>
                                    </tr>
                                </tfoot>
                            
                        </table>
                        
                    </div>

                    <div id="formacao" class="tab-pane" role="tabpanel">
                        
                        
                        <form class="form-group" name="cadastrar_formacao" method="post" action="index.html">
                            <table id="dados_formacao_cadastrar" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Instituição:</th>
                                        <td colspan="3"><select class="form-control small" required name="instituicao">
                                                <option value="1">....</option>
                                                <option value="2">.......</option>
                                                <option value="3">...........</option>
                                                <option value="4">Outros</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        
                                        <th>Curso: </th>
                                        <td colspan="3">
                                            <select class="form-control small" required name="curso">
                                                <option value="1">....</option>
                                                <option value="2">.......</option>
                                                <option value="3">...........</option>
                                                <option value="4">Outros</option>
                                            </select>
                                        </td>
                                        
                                    </tr>
                                    
                                    
                                    <tr>
                                        
                                        <th>Outro curso: </th>
                                        <td colspan="3">
                                            <input class="form-control small" type="text" name="dataDe">
                                        </td>
                                        
                                    </tr>


                                    <tr>
                                        <th>Data de: </th>
                                        <td><input class="form-control small" type="date" required name="dataDe"></td>
                                        <th>Data até: </th>
                                        <td><input class="form-control small" type="date" name="dataAte"></td>
                                    </tr>


                                    <tr>
                                        <th>Concluído: </th>
                                        <td colspan="3">
                                            <select class="form-control small" name="concluido">
                                                <option value="0">Não</option>
                                                <option value="1">Sim</option>
                                                
                                            </select>
                                        </td>

                                    </tr>

                                </thead>
                                <tfoot>
                                    <tr>
                                        <td colspan="4">
                                            <input name="btn_ok" type="submit" value="Incluir formação" class="btn btn-success">
                                        </td>
                                    </tr>
                                </tfoot>

                            </table>
                        
                        </form>
                        
                        <table class="table table-bordered table-striped" id="btn_listar_experiencias">
                            <thead>
                                <tr>
                                    <th>Curso</th>
                                    <th>Instituição</th>
                                    <th>Período</th>
                                    <th>Concluído</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                                <tr>
                                    <td>Técnico em Informática</td>
                                    <td>EEEPE</td>
                                    <td>01/03/2010 - 22/12/2012</td>
                                    <td>Sim</td>
                                    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a><a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
                                </tr>
                                
                                <tr>
                                    <td>Sistemas de Informação</td>
                                    <td>Univates</td>
                                    <td>01/06/2012 - 01/05/2015</td>
                                    <td>Não</td>
                                    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a><a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
                                </tr>
                                
                                
                                <tr>
                                    <td>Análise e Desenvolvimento de Sistemas</td>
                                    <td>Univates</td>
                                    <td>01/03/2015 - 15/12/2017</td>
                                    <td>Não</td>
                                    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a><a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
                                </tr>
                                
                                 <tr>
                                    <td>Programação Avançada PHP</td>
                                    <td>Univates</td>
                                    <td>01/03/2010 - 15/07/2010</td>
                                    <td>Sim</td>
                                    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a><a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
                                </tr>
                                
                                
                                 <tr>
                                    <td>Programação Android</td>
                                    <td>Univates</td>
                                    <td>01/05/2014 - 01/07/2014</td>
                                    <td>Sim</td>
                                    <td><a href="#"><i class="glyphicon glyphicon-trash"></i></a><a href="#"><i class="glyphicon glyphicon-edit"></i></a></td>
                                </tr>
                                
                                
                                
                                
                                <tfoot>
                                    <tr>
                                        <td colspan="4"><small>5 cadastros</small></td>
                                    </tr>
                                </tfoot>
                            
                        </table>
                    </div>


                    <div id="processos_seletivos" class="tab-pane" role="tabpanel">
                        <table class="table table-bordered table-striped" id="btn_listar_experiencias">
                            <thead>
                                <tr>
                                    <th>Vaga</th>
                                    <th>Recrutador</th>
                                    <th>Parecer</th>
                                </tr>
                            </thead>
                            
                                <tr>
                                    <td>Gerente</td>
                                    <td>Fernanda</td>
                                    <td>Agradecemos o contato, porém nesta oportunidade seu perfil não foi selecionado.</td>
                                </tr>
                             
                                <tfoot>
                                    <tr>
                                        <td colspan="4"><small>1 cadastro</small></td>
                                    </tr>
                                </tfoot>
                            
                        </table>
                    </div>
                </div>
        
    </div>
        
        <%@ include file="includes/footer.jsp" %>
        
       