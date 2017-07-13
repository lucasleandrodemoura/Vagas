

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


public class candidatarVaga extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo_vaga = request.getParameter("codigo_vaga");
        String candidato = request.getParameter("candidato");
        
        Conexao x;
        try {
            x = new Conexao();
            x.incluir("INSERT INTO candidatura (codigo_vaga,codigo_candidato) VALUES ("+codigo_vaga+","+candidato+");");
            x.fechar();
            request.getRequestDispatcher("editar_curriculo.jsp").forward(request, response);
        } catch (SQLException ex) {
            response.getWriter().println("<script>alert('Ocorreu um erro: '" + ex.getMessage() + ")</script>");
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet";
    }

}
