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

<%    if (session.getValue("logado") == null) {
        response.sendRedirect("index.jsp");
    } else {
%>
<%

%>
<div class="col-lg-12">    
    <ol class="breadcrumb bg-info">
        <li><a href="editar_perfil.jsp">Dados básicos</a></li>
        <li><a href="editar_experiencias.jsp">Experiências</a></li>
        <li class="active">Formação</li>
    </ol>

    <form method="post" action="incluiFormacao">
<input class="form-control small" value="<%=session.getAttribute("id_curriculo").toString()%>" type="text" name="id_curriculo">
        <h3>Formação</h3>
        <table id="dados" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Curso:</th>
                    <td colspan="3">
                        <select class="form-control small" required name="curso">
                            <option value=""></option>
                            <%
                                Conexao conecta = new Conexao();
                                ResultSet x = conecta.selecionar("select codigo_curso,nome_curso from cursos ORDER BY nome_curso");
                                while (x.next()) {

                                    out.print("<option value='" + x.getString("codigo_curso") + "'>" + x.getString("nome_curso") + "</option>");
                                }
                                conecta.fechar();
                            %>
                        </select></td>
                </tr>



                <tr>
                    <th>Outros: </th>
                    <td><input class="form-control small" value="" type="text" name="outros"></td>
                    <th>Concluído:</th>
                    <td>
                        <select class="form-control small" required name="concluido">
                            <option value=""></option>
                            <option value="1">Sim</option>
                            <option value="0">Não</option>
                        </select>

                    </td>

                </tr>



                <tr>
                    <th>Inicio: </th>
                    <td><input class="form-control small" value="" type="date" name="inicio"></td>
                    <th>Fim/Prev:</th>
                    <td><input class="form-control small" value="" type="date" name="fim">                                </td>

                </tr>

                <tr>
                    <th>Instituição:</th>
                    <td colspan="3">
                        <select class="form-control small" required name="instituicao">
                            <option value=""></option>
                            <%
                                conecta = new Conexao();
                                ResultSet g = conecta.selecionar("select codigo_instituicao,nome from instituicoes order by nome");
                                while (g.next()) {

                                    out.print("<option value='" + g.getString("codigo_instituicao") + "'>" + g.getString("nome") + "</option>");
                                }
                                conecta.fechar();
                            %>
                        </select>

                    </td>

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

    </form>




    <table class="table table-bordered table-striped table-hover" id="table_completo">
        <thead>
            <tr>
                <th>Curso</th>
                <th>Instituição</th>
                <th>Concluído</th>
                <th>Inicio</th>
                <th>Fim</th>
                <th>Ações</th>
            </tr>
        </thead>
        <%
            String s = "select cursos.nome_curso as curso,instituicoes.nome as universidade,CASE WHEN concluido = TRUE THEN 'Sim' ELSE 'Não' END as concluido,to_char(inicio, 'DD/MM/YYYY') as inicio,to_char(fim, 'DD/MM/YYYY') as fim,codigo_formacao from formacao INNER JOIN cursos ON cursos.codigo_curso = formacao.curso INNER JOIN instituicoes ON formacao.codigo_instituicao = instituicoes.codigo_instituicao WHERE codigo_curriculo = " + session.getAttribute("id_curriculo").toString();
            Conexao conecExperiencias = new Conexao();
            ResultSet t = conecExperiencias.selecionar(s);
            while (t.next()) {

        %>
        <tr>
            <td><%=t.getString("curso")%></td>
            <td><%=t.getString("universidade")%></td>
            <td><%=t.getString("concluido")%></td>
            <td><%=t.getString("inicio")%></td>
            <td><%=t.getString("fim")%></td>
            <td><a 
                    href="javascript:excluir(<%=t.getString("codigo_formacao")%>,'editar_formacao','formacao','codigo_formacao');" 
                    class="btn btn-default">
                    <i class="glyphicon glyphicon-trash"></i>
                </a></td>
        </tr>   
        <%
            }
            conecExperiencias.fechar();

        %>

    </table>




    <div class="row">
        <div class="col-lg-6" style="text-align: right"><a name="btn_next" href="editar_experiencias.jsp" class="btn btn-warning">Voltar</a></div>
        <div class="col-lg-6"><button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Concluir</button></div>
    </div>
</div>
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Aviso</h4>
            </div>
            <div class="modal-body">
                Seu currículo foi atualizado com sucesso!
            </div>

            <div class="modal-footer">
                <a name="btn_next" href="javascript:ConcluirCurriculo();" class="btn btn-primary">Fechar</a>
            </div>
        </div>
    </div>
</div>


<%    }
%>
<%@ include file="includes/footer.jsp" %>

