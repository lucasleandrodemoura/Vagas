
<%@page import="br.univates.progweb.models.Curriculo"%>
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
             
                String cpf = request.getParameter("login");
                String senha = request.getParameter("senha");
                //Esta perdendo o request.getParameter da senha, esta retornando nulo a partir do dia 15/07.
                //Somente para o segundo registro
                out.print(cpf);
                out.print(senha);
                        
                Curriculo x = new Curriculo();
                x.setCpf(cpf);
                x.setSenha(senha);
                
                if(x.logar()){
                    
                    session.setAttribute("usuario", x.getCpf());
                    session.setAttribute("id_curriculo", x.getIdcurriculo());
                    session.setAttribute("email", x.getEmail());                    
                    session.setAttribute("nome", x.getNome());                  
                    session.setAttribute("logado", 1);  
                    
                    response.sendRedirect("editar_curriculo.jsp");
                }else{
                    response.sendRedirect("index.jsp");
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>

        
    </body>
</html>
