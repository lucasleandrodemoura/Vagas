
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processar Login</title>
    </head>
    <body>

        <%
            try {
             
                String login = request.getParameter("login");
                String senha = request.getParameter("senha");

              
                    session.setAttribute("usuario_admin", login);
                    
                   
                    response.sendRedirect("admin_logado.jsp"); // não irá funcionar!!
                    //out.print(session.getAttribute("usuario"));
                    
                

            } catch (Exception e) {
            }

        %>

        
    </body>
</html>
