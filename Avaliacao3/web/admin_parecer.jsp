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
        
        %>
        <%
            String g = "select * from candidatura where codigo_vaga = " +request.getParameter("codigo_vaga")+" and codigo_candidato = "+request.getParameter("cod");
            
            Conexao conecExperiencias = new Conexao();
            ResultSet t = conecExperiencias.selecionar(g);
            String parecer = "";
            while (t.next()) {
                parecer = t.getString("parecer");
            }
            conecExperiencias.fechar();
        %>
        
        
        <div class="row">
                    <div class="col-lg-12">
                        <form name="formulario" method="post" action="atualizaParecer">
                            <input type="hidden" name="codigo_vaga" value="<%=request.getParameter("codigo_vaga")%>">
                            <input type="hidden" name="codigo_candidato" value="<%=request.getParameter("cod")%>">
                            <label>Parecer:</label>
                            <textarea class="form-control" required rows="5" name="parecer"><%=parecer%></textarea>
                            <input type="submit" value="Atualizar" class="btn btn-success">
                        </form>
   

                    </div>
                            
        </div>
            