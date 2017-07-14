

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


public class atualizaParecer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo_vaga = request.getParameter("codigo_vaga");
        String codigo_curriculo = request.getParameter("codigo_candidato");
        String parecer = request.getParameter("parecer");
        
        
        Conexao x;
        try {
            x = new Conexao();
            x.incluir("UPDATE candidatura SET parecer = '"+parecer+"' WHERE codigo_vaga = "+codigo_vaga+" and codigo_candidato = "+codigo_curriculo);
            
            x.fechar();
            
            response.getWriter().println("Parecer gravado com sucesso ");
        } catch (SQLException ex) {
            response.getWriter().println("<script>alert('Ocorreu um erro: '" + ex.getMessage() + ")</script>");
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet";
    }

}
