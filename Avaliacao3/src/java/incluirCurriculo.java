

/**
 * @author: Vilson Cristiano Gärtner
 * @email: vilson@gartner.net.br
 */

import br.univates.progweb.models.Curriculo;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.univates.progweb.util.Conexao;
import org.apache.catalina.session.StandardSession;
import sun.security.pkcs11.wrapper.Functions;



public class incluirCurriculo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String estadoCivil = request.getParameter("estadoCivil");
        String dataNascimento = request.getParameter("dataNascimento");
        String endereco = request.getParameter("endereco");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        
        
        String sql = "INSERT INTO curriculo ("
                + "nome,"
                + "cpf,"
                + "email,"
                + "senha,"
                + "estado_civil,"
                + "data_nascimento,"
                + "endereco,"
                + "bairro,"
                + "cidade_residencia,"
                + "telefone,"
                + "celular)"
                + "VALUES ("
                + "'"+nome+"',"
                + "'"+cpf+"',"
                + "'"+email+"',"
                + "'"+senha+"',"
                + "'"+estadoCivil+"',"
                + "'"+dataNascimento+"',"
                + "'"+endereco+"',"
                + "'"+bairro+"',"
                + ""+cidade+","
                + "'"+telefone+"',"
                + "'"+celular+"'"
                + ")";
       
        System.out.println(sql);
        
        try {
            Conexao x = new Conexao();
            if(x.incluir(sql)){
                response.getWriter().println("<script>alert('Cadastrado com sucesso')</script>");
                response.sendRedirect("processa_login.jsp?login="+cpf+"&senha="+senha);
                
            }else{
                response.getWriter().println("<script>alert('Não foi possível realizar inclusão')</script>");
                
            }
            
            
            x.fechar();
            
            
        } catch (SQLException ex) {
            
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para incluir vaga";
    }

}
