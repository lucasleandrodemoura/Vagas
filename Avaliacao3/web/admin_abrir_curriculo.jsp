<%-- 
    Document   : index
    Created on : 08/06/2017, 10:36:11
    Author     : lucasmoura
--%>

        <html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Vagas</title>
    </head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <!-- Customizações do framework front-end bootstra !-->
    
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/funcoes.js"></script>
        <script src="<%=request.getContextPath()%>/includes/icheck/icheck.min.js"></script>
        <link href="<%=request.getContextPath()%>/includes/icheck/flat/green.css" rel="stylesheet">
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/includes/icone.png">



<%@page import="br.univates.progweb.models.Curriculo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.progweb.util.Conexao"%>
<%@page import="org.apache.catalina.session.StandardSession"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
 <%
        
        if(!session.getAttribute("logado_admin").equals(1)){
            response.sendRedirect("admin_logado.jsp");
        }
        Curriculo informacao = new Curriculo(Integer.parseInt(request.getParameter("cod")));
        %>
        
        
        
        <div class="row">
                    <div class="col-lg-12">
                        <h3>Curriculo profissional</h3>
                        
                            <div class="col-lg-6">
                                <label>Nome:</label> <%=informacao.getNome()%>
                            </div>
                        
                            
                            
                            <div class="col-lg-6">
                                <label>Data de Nascimento:</label>
                           
                                <%=informacao.getDataNascimento()%>
                            </div>
                  
                            <div class="col-lg-6">
                                <label>Celular:</label>
                      
                                <%=informacao.getCelular()%>
                            </div>
                      
                            <div class="col-lg-6">
                                <label>Telefone:</label>
                           
                                <%=informacao.getTelefone()%>
                            </div>
                     
                            <div class="col-lg-6">
                                <label>Endereço:</label>
                            
                                <%=informacao.getEndereco()%>
                            </div>
                   
                            <div class="col-lg-6">
                                <label> Bairro:</label>
                            
                                <%=informacao.getBairro()%>
                            </div>
                  
                            <div class="col-lg-6">
                                <label> Email</label>
                            
                                <%=informacao.getEmail()%>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <h4>Experiencias Profissionais</h4>
                            </div>
                            
                            <div class="col-lg-12">
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
                      String s = "select nome_empresa, cargos.descricao as ultimo_cargo_ocupado, to_char(data_de, 'DD/MM/YYYY') as data_de, to_char(data_ate, 'DD/MM/YYYY') as data_ate, codigo_experiencia from experiencia INNER JOIN cargos ON cargos.codigo_cargo = experiencia.ultimo_cargo_ocupado where codigo_curriculo = "+request.getParameter("cod");
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
                    </div>
                    
                    <div class="col-lg-12">
                        <h4>Formaçao</h4>
                        
                         <table class="table table-bordered table-striped table-hover" id="table_completo">
        <thead>
            <tr>
                <th>Curso</th>
                <th>Instituição</th>
                <th>Concluído</th>
                <th>Inicio</th>
                <th>Fim</th>
                
            </tr>
        </thead>
        <%
            String g = "select cursos.nome_curso as curso,instituicoes.nome as universidade,CASE WHEN concluido = TRUE THEN 'Sim' ELSE 'Não' END as concluido,to_char(inicio, 'DD/MM/YYYY') as inicio,to_char(fim, 'DD/MM/YYYY') as fim,codigo_formacao from formacao INNER JOIN cursos ON cursos.codigo_curso = formacao.curso INNER JOIN instituicoes ON formacao.codigo_instituicao = instituicoes.codigo_instituicao WHERE codigo_curriculo = " +request.getParameter("cod");
            conecExperiencias = new Conexao();
            t = conecExperiencias.selecionar(g);
            while (t.next()) {

        %>
        <tr>
            <td><%=t.getString("curso")%></td>
            <td><%=t.getString("universidade")%></td>
            <td><%=t.getString("concluido")%></td>
            <td><%=t.getString("inicio")%></td>
            <td><%=t.getString("fim")%></td>
           
        </tr>   
        <%
            }
            conecExperiencias.fechar();

        %>

    </table>
                        
                    </div>
                         
                    
                    
                    </div>
                            
        </div>
            