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
    
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/funcoes.js"></script>
        <script src="<%=request.getContextPath()%>/includes/icheck/icheck.min.js"></script>
        <link href="<%=request.getContextPath()%>/includes/icheck/flat/green.css" rel="stylesheet">
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/includes/icone.png">
        
        <script src="<%=request.getContextPath()%>/includes/datatables/js/jquery.dataTables.js"></script>
        <script src="<%=request.getContextPath()%>/includes/datatables/tools/js/dataTables.tableTools.js"></script>
        <script src="<%=request.getContextPath()%>/includes/datatables/tools/js/jquery.dataTables.columnFilter.js"></script>
        <link rel="stylesheet" type="text/css" href="css/custom.css" />
        
        
        <script type="text/javascript">
            
            
            <!-- Fun��o javascript para chamar Srvlet de exclus�o de registro -->
            function excluirRegistro(codigo, nome) {
                if (confirm('Confirmar exclus�o?')) {
                    window.location.href = "<%=request.getContextPath()%>/"+nome+"?cod=" + codigo;
                } else {
                    alert('Exclus�o cancelada.');
                }
            }
            
            $(document).ready(function(){
                $('#tableDinamic').DataTable();
            });
            
        </script> 
    <body>
        <!-- Inicio da barra no topo !-->
        
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Vagas & VC</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <% 
            // Verificar se j� foi efetuado login
            if ( session.getAttribute("usuario") == null && session.getAttribute("usuario_admin") == null ) {
                %>
                
                
                
                
       <ul class="nav navbar-nav">
                
                <li><a href="index.jsp" id="nav_home">Vagas</a></li>
                <li><a href="cadastrar.jsp" title="Cadastre o seu curr�culo" id="nav_cadastrar">Cadastre-se</a></li>
                
                <li><a href="admin_logado.jsp" title="Abrir �rea administrativa">�rea Administrativa</a></li>
            </ul>
      <form class="navbar-form navbar-right" method="post" action="processa_login.jsp">
                <div class="form-group">
                    <label>CPF</label> <input type="text" value="" name="login" required id="login" class="form-control small cpf" placeholder="CPF">
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
            <li class="active"><a><%=session.getAttribute("nome").toString()%></a></li>
                <li ><a href="editar_curriculo.jsp" id="nav_home">Vagas</a></li>
                <li><a href="editar_perfil.jsp" title="Cadastre o seu curr�culo" id="nav_cadastrar">Editar curr�culo</a></li>
                <li><a href="logout.jsp" title="Sair" id="nav_cadastrar">Logout</a></li>
            </ul>
         <% 
            }
                %>
                </div>
                </div>
        <!-- Fim da barra no topo !-->
        </nav>
        
              <!-- Inicio pagina de conteudo !-->
        <div class="col-xs-12">
            <div class="block-grid">
                <div class="conteudo">
                <div class="row">
                    