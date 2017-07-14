

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


public class contratarFuncionario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo_vaga = request.getParameter("codigo_vaga");
        String codigo_curriculo = request.getParameter("codigo_curriculo");
        
        
        Conexao x;
        try {
            x = new Conexao();
            x.incluir("UPDATE candidatura SET parecer = 'Seja bem vindo, voce esta contratado!' WHERE codigo_vaga = "+codigo_vaga+" and codigo_candidato = "+codigo_curriculo);
            x.incluir("UPDATE candidatura SET parecer = 'Agradecemos a sua participaçao, mas desta vez nao foi possivel dar andamento com o processo!' WHERE codigo_vaga = "+codigo_vaga+" and codigo_candidato <> "+codigo_curriculo);
            x.incluir("UPDATE vagas SET aberto_ate = '1969-01-01', candidato_selecionado = "+codigo_curriculo+" where idvagas = "+codigo_vaga);
            x.fechar();
            response.getWriter().println("Candidato selecionado!");
        } catch (SQLException ex) {
            response.getWriter().println("<script>alert('Ocorreu um erro: '" + ex.getMessage() + ")</script>");
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet";
    }

}
