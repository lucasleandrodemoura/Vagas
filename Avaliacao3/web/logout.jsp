
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css"> 
        <title>Desconectar</title>
    </head>
    <body>
        <%
            // Excluir informações da sessão
            session.invalidate();
            response.sendRedirect("index.jsp"); // não irá funcionar!!
        %>
       
        
    </body>
</html>
