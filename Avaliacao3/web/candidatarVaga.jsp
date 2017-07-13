

<%@page import="br.univates.progweb.models.Curriculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidatar</title>
    </head>
    <body>

        <%
                    String id_curriculo = session.getAttribute("id_curriculo").toString();
                    
            
                    response.sendRedirect("editar_curriculo.jsp");
            

        %>

        
    </body>
</html>
