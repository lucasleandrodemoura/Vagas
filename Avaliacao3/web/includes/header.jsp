<%-- 
    Document   : header
    Created on : 08/06/2017, 10:33:10
    Author     : lucasmoura
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Vagas</title>
    </head>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <!-- Customiza��es do framework front-end bootstra !-->
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/funcoes.js"></script>
    <body>
        <!-- Inicio da barra no topo !-->
        <nav class="navbar navbar-default navbar-fixed-top">
            <a class="navbar-brand" href="#" id="nav_title">Vagas&VC</a>
               <% 
            // Verificar se j� foi efetuado login
            if ( session.getAttribute("usuario") == null && session.getAttribute("usuario_admin") == null ) {
                %>
        
            <ul class="nav navbar-nav">
                
                <li><a href="index.jsp" id="nav_home">Vagas</a></li>
                <li><a href="cadastrar.jsp" title="Cadastre o seu curr�culo" id="nav_cadastrar">Cadastre-se</a></li>
            </ul>
            
            <form class="navbar-form navbar-right" method="post" action="processa_login.jsp">
                <div class="form-group">
                    <label>CPF</label> <input type="text" value="" name="login" required id="login" class="form-control small" placeholder="CPF">
                    <label>Senha:</label> <input type="password" value=""  name="senha" required id="senha" class="form-control small" placeholder="">
                </div>
                <button type="submit" class="btn btn-default">Meu CV</button>
            </form>
        
               <% 
            // Verificar se j� foi efetuado login
                    } 
                else if(session.getAttribute("usuario_admin") != null && session.getAttribute("usuario") == null )               {
               %>
               <ul class="nav navbar-nav">
                <li><a href="admin_logado.jsp" id="nav_home">Vagas</a></li>
                <li><a href="admin_curriculos.jsp" title="Visualizar todos os curr�culos cadastrados" id="nav_cadastrar">Visualizar curr�culos</a></li>
                <li><a href="admin_usuarios.jsp" title="Realize a manuten��o de todos os cadastros de usu�rios administradores do sistema" id="nav_cadastrar">Recrutadores</a></li>
                <li><a href="admin_cidades.jsp" title="Cidades" id="nav_cadastrar">Cidades</a></li>
                <li><a href="admin_cargos.jsp" title="Cargos" id="nav_cadastrar">Cargos</a></li>
                <li><a href="admin_instituicoes.jsp" title="Universidades" id="nav_cadastrar">Institui��es</a></li>
                <li><a href="admin_cursos.jsp" title="Cursos" id="nav_cadastrar">Cursos</a></li>
                <li><a href="logout.jsp" title="Logout" id="nav_logout">Logout</a></li>
            </ul>
            
               
                <% 
                    } else {
                %>
        
        <ul class="nav navbar-nav">
                <li class="active"><a href="editar_curriculo.jsp" id="nav_home">Vagas</a></li>
                <li><a href="editar_perfil.jsp" title="Cadastre o seu curr�culo" id="nav_cadastrar">Editar curr�culo</a></li>
                <li><a href="logout.jsp" title="Sair" id="nav_cadastrar">Logout</a></li>
            </ul>
         <% 
            }
                %>
        <!-- Fim da barra no topo !-->
        </nav>
        
              <!-- Inicio pagina de conteudo !-->
        <div class="col-xs-12">
            <div class="block-grid">
                <dic class="conteudo">
                <div class="row">
                    