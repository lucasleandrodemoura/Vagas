

/**
 * @author: Vilson Cristiano Gärtner
 * @email: vilson@gartner.net.br
 */

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.univates.progweb.util.Conexao;

public class excluirCidade extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");
        Conexao x;
        try {
            x = new Conexao();
            x.incluir("DELETE FROM cidades WHERE codigo_cidade = "+cod);
            x.fechar();
            request.getRequestDispatcher( "admin_cidades.jsp" ).forward(request, response);
        } catch (SQLException ex) {
            response.getWriter().println("<script>alert('Ocorreu um erro ao excluir: '" + ex.getMessage() + ")</script>");
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para excluir";
    }

}
