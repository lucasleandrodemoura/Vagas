

/**
 * @author: Vilson Cristiano Gärtner
 * @email: vilson@gartner.net.br
 */

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



public class incluirVaga extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String titulo = request.getParameter("titulo");
        String salario = request.getParameter("salario");
        String aberto_ate = request.getParameter("aberto_ate");
        String cidade = request.getParameter("cidade");
        String requisitos = request.getParameter("requisitos");
        String descricao = request.getParameter("descricao");
        
       
        String sql = "INSERT INTO vagas(\n" +
"            aberto_ate, \n" +
"            descricao, \n" +
"            requisitos, \n" +
"            codigo_cidade, \n" +
"            salario, \n" +
"            titulo)\n" +
"    VALUES (\n" +
"    '"+aberto_ate+"', \n" +
"    '"+descricao+"', \n" +
"    '"+requisitos+"', \n" +
"    "+cidade+", \n" +
"    "+salario+", \n" +
"    '"+titulo+"');";
        
        try {
            Conexao x = new Conexao();
            if(x.incluir(sql)){
                response.getWriter().println("<script>alert('Cadastrado com sucesso')</script>");
                
                
            }else{
                response.getWriter().println("<script>alert('Não foi possível realizar inclusão')</script>");
             
            }
               request.getRequestDispatcher( "admin_logado.jsp" ).forward(request, response);
            x.fechar();
            
            
        } catch (SQLException ex) {
            
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet para incluir vaga";
    }

}
