

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


public class suspenderVaga extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo_vaga = request.getParameter("cod");
        
        
        Conexao x;
        try {
            x = new Conexao();
            x.incluir("UPDATE candidatura SET parecer = 'Vaga suspensa' WHERE codigo_vaga = "+codigo_vaga);
            x.incluir("UPDATE vagas SET aberto_ate = '1969-01-01' where idvagas = "+codigo_vaga);
            x.fechar();
            request.getRequestDispatcher("admin_logado.jsp").forward(request, response);
        } catch (SQLException ex) {
            response.getWriter().println("<script>alert('Ocorreu um erro: '" + ex.getMessage() + ")</script>");
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet";
    }

}
