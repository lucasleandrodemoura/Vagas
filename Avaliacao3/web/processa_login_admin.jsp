
<%@page import="br.univates.progweb.models.Administradores"%>
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
             
                String email = request.getParameter("login");
                String senha = request.getParameter("senha");
                
                Administradores x = new Administradores();
                x.setEmail(email);
                x.setSenha(senha);
                if(x.logar()){
                    session.setAttribute("usuario_admin", x.getEmail());
                    session.setAttribute("id_usuarios", x.getCodigoUsuario());
                    session.setAttribute("logado_admin", 1);
                    response.sendRedirect("admin_logado.jsp");
                }else{
                    response.sendRedirect("index.jsp");
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>

        %>

        
    </body>
</html>
