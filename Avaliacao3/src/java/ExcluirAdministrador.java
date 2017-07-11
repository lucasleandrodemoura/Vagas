

/**
 * @author: Vilson Cristiano Gärtner
 * @email: vilson@gartner.net.br
 */

import br.univates.progweb.util.Conexao;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ExcluirAdministrador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        Conexao x;
        try {
            x = new Conexao();
            x.incluir("DELETE FROM administradores WHERE codigo_usuario = "+codigo);
            x.fechar();
            request.getRequestDispatcher( "admin_usuarios.jsp" ).forward(request, response);
        } catch (SQLException ex) {
            response.getWriter().println("<script>alert('Ocorreu um erro ao excluir: '" + ex.getMessage() + ")</script>");
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para excluir";
    }

}
